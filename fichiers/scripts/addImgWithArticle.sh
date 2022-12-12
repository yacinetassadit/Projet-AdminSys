#!/bin/bash

function addImgWithArticle {
  article=$ARTICLE_PATH
  
  if [ -e "$article" ];then
    ext=${article##*.}
    declare -a extensions=( "txt" "csv" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then

        if [ -e "fichiers/scripts/addImg.sh" ];then
        /bin/bash fichiers/scripts/addImg.sh
       
       retval=$?
       if [ "$retval" == 0 ]; then
        exit 0
        else :
       fi

       else
         echo "File addImg.sh not Found"
       exit 0
       fi 

        cp "$ARTICLE_PATH" fichiers/articles/
        nomFichier=$(basename "${ARTICLE_PATH}")
        nomImage=$(basename "${IMG_PATH}")
        echo "$nomFichier;$nomImage">>fichiers/database.csv
        echo "Article ajouté. "

        if [ -e "fichiers/scripts/createWebPage.sh" ];then
        /bin/bash fichiers/scripts/createWebPage.sh
       else
         echo "File createWebPage.sh not found"
       fi

      else
        echo "Mettez le chemin d'un fichier txt ou csv! SVP"
      fi
    else
    echo "File $ARTICLE_PATH not found"
  fi
}


addImgWithArticle
