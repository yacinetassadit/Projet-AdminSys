#!/bin/bash

case $# in

  0)
     if [ -e "fichiers/scripts/createWebPage.sh" ];then
        /bin/bash ./fichiers/scripts/createWebPage.sh
        else
        echo "File createWebPage.sh not found"
        exit 0
     fi ;;
  1)
     if [ "$1" = "--help" ] || [ "$1" = "-h" ]
       then

          if [ -e "fichiers/scripts/help.sh" ];then
            /bin/bash fichiers/scripts/help.sh
          else
            echo "File help.sh not found"
          exit 0
          fi
    elif [ "$1" = "addImg" ]
       then
          echo "veuillez indiquer le chemin de l'image"
    elif [ "$1" = "addArticle" ]
       then
          echo "il manque un argument! "
    elif [ "$1" = "internet" ]
       then
          if [ -e "fichiers/scripts/accessInternet.sh" ];then
        /bin/bash fichiers/scripts/accessInternet.sh
       else
         echo "File accessInternet.sh not found"
       exit 0
       fi
     else
       echo  "Syntax error"
     fi;;
  2) 

    if [ "$1" = "addImg" ]
      then

        IMG_PATH=$2
        IMGDIR_PATH="Images/"
        export IMG_PATH
        export IMGDIR_PATH

       if [ -e "fichiers/scripts/addImg.sh" ];then
        /bin/bash fichiers/scripts/addImg.sh
       else
         echo "Scrpit addImg.sh not found"
       exit 0
       fi 

    elif [ "$1" = "addArticle" ]
      then

        ARTICLE_PATH=$2
        export ARTICLE_PATH

        if [ -e "fichiers/scripts/addArticle.sh" ];then
        /bin/bash fichiers/scripts/addArticle.sh
       else
         echo "Script addArticle.sh not found"
       exit 0
       fi 
    else
       echo "Syntax error"
     fi;;  
  3)
    if [ "$1" = "addArticle"  ] && [ "$3" = "addImg"  ]
      then
         echo "Il manque un argument."
    else
    echo "Syntax error."
    fi;;
  4)
    
    if [ "$1" = "addArticle" ] && [ "$3" = "addImg"  ]
      then

        ARTICLE_PATH=$2
        IMGDIR_PATH="fichiers/Images_articles/"
        IMG_PATH=$4
        export ARTICLE_PATH
        export IMGDIR_PATH
        export IMG_PATH

        if [ -e "fichiers/scripts/addImgWithArticle.sh" ];then
        /bin/bash fichiers/scripts/addImgWithArticle.sh
       else
         echo "scripts addImgWithArticle.sh not found"
       exit 0
       fi 

    else
      echo "Syntax error."
    fi;;
  *)
    echo "Beaucoup trop d'arguments !!!";;
esac
