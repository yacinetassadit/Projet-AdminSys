#!/bin/bash

function addArticle { 
  article=$ARTICLE_PATH
  
  if [ -e "$article" ];then
    ext=${article##*.}
    declare -a extensions=( "txt" "csv" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$ARTICLE_PATH" fichiers/articles/
        nom_fichier=$(basename "${ARTICLE_PATH}")
        echo "$nom_fichier;null">>fichiers/database.csv
        echo "Article ajouté."

        if [ -e "fichiers/scripts/createWebPage.sh" ];then
        /bin/bash fichiers/scripts/createWebPage.sh
       else
         echo "Script createWebPage.sh not found"
       fi

      else
        echo "Veuillez mettre le chemin du fichier"
      fi
    else
    echo "File $ARTICLE_PATH Not Found"
  fi
}





addArticle
