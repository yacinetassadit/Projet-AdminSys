#!/bin/bash


function addImg {
  val=0

  img=$IMG_PATH
  if [ -e "$img" ];then
    ext=${img#*.}
    declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
      if [[ " ${extensions[*]} " =~ $ext ]]; then
        cp "$IMG_PATH" "$IMGDIR_PATH"
        val=1
        echo "Image ajoutée."

        if [ -e "fichiers/scripts/createWebPage.sh" ];then
        /bin/bash fichiers/scripts/createWebPage.sh
       else
         echo "Script createWebPage.sh Not Found"
       fi
       
      else
        echo "Veuillez mettre le chemin de l'image "
      fi
    else
    echo "File $IMG_PATH Not Found"
  fi
  
return "$val"
}



addImg
