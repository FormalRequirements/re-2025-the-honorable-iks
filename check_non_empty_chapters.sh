#!/bin/bash

file="Requirements.adoc"
inside_section=false
section_start=""
section_content=""
error=0

while IFS= read -r line; do
    # Detect section start with WARNING
    if [[ "$line" == *"WARNING: This chapter should not be empty"* ]]; then
        inside_section=true
        section_start="$line"
        section_content=""
        continue
    fi

    # Detect section end (headers)
    if [[ "$inside_section" == true ]] && [[ "$line" =~ ^(==|===) ]]; then
        inside_section=false
        
        # Check if section had content
        if [[ -z "$section_content" ]]; then
            echo "Empty section detected after warning:"
            echo "$section_start"
            echo "---"
            error=1
        fi
    fi

    # Collect non-empty content within section
    if [[ "$inside_section" == true ]]; then
        # Ignore empty lines and comments
        if [[ -n "$line" ]] && 
           [[ ! "$line" =~ ^[[:space:]]*$ ]] && 
           [[ ! "$line" =~ ^// ]] && 
           [[ ! "$line" =~ ^: ]]; then
            section_content+="$line"
        fi
    fi
done < "$file"

# Check last section if file ends without new header
if [[ "$inside_section" == true ]] && [[ -z "$section_content" ]]; then
    echo "Empty section detected at end of file:"
    echo "$section_start"
    echo "---"
    error=1
fi

if [[ "$error" -eq 1 ]]; then
    echo "Error: Mandatory section(s) are empty."
    exit 1
else
    echo "All mandatory sections contain content."
    exit 0
fi