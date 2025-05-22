#!/bin/bash

file="Requirements.adoc"
inside_section=false
section_start=""
section_content=""
error=0

while IFS= read -r line; do


while IFS= read -r line; do
  # Détection du début de la section à vérifier (après le warning)

  if [[ "$line" == *"WARNING: This chapter should not be empty"* ]]; then
    inside_section=true
    section_start="$line"
    section_content=""
    continue
  fi


  if [[ "$inside_section" == true ]]; then
    if [[ "$line" =~ ^(==|===) ]]; then
      inside_section=false
  # Si on est dans la section à vérifier
  if [[ "$inside_section" == true ]]; then
    # Vérifie si on rencontre un nouveau chapitre
    if [[ "$line" =~ ^(==|===) ]]; then
      inside_section=false
      # Vérifie si la section n'a que des lignes vides

      if [[ -z "$section_content" ]]; then
        echo "Section vide détectée après le warning:"
        echo "$section_start"
        echo "---"

        error=1
      fi
    else

      fi
    else
      # Ajoute la ligne au contenu si elle n'est pas vide (hors espaces)

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

