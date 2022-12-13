#!/bin/bash


function build {

  dossier=$BUILD_PATH

if [[ -d "$dossier" ]]; then  
  wget -q --spider http://google.com
  if [ $? -eq 0 ]; then
  :
  else
  sleep 5s
  echo "Connectez vous à internet pour éxecuter le script !"
  exit 0
  fi
   
   cp "blog.sh" "$dossier"
   cp -avr "fichiers/scripts" "$dossier" 
   cd "$dossier" || exit 

  
   if [ -e "fichiers/scripts/createWebPage.sh" ];then
    /bin/bash ./fichiers/scripts/createWebPage.sh
    else
    echo "createWebPage.sh Not Found !!"
    exit 0
  fi
  
  else
   echo "Folder $dossier Not Found !"
fi
}

#appel à la fonction build

build
