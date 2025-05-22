#!/bin/bash

file="Requirements.adoc"
inside_section=false
section_start=""
section_content=""
error=0

while IFS= read -r line; do
  if [[ "$line" == *"WARNING: This chapter should not be empty"* ]]; then
    inside_section=true
    section_start="$line"
    section_content=""
    continue
  fi

  if [[ "$inside_section" == true ]]; then
    if [[ "$line" =~ ^(==|===) ]]; then
      inside_section=false
      if [[ -z "$section_content" ]]; then
        echo "Section vide détectée après le warning:"
        echo "$section_start"
        echo "---"
        error=1
      fi
    else
      if [[ -n "$line" && ! "$line" =~ ^[[:space:]]*$ ]]; then
        section_content+="$line"
      fi
    fi
  fi
done < "$file"

if [[ "$error" -eq 1 ]]; then
  echo "Erreur : au moins une section obligatoire est vide."
  exit 1
fi
