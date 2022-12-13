#!/bin/bash


function accessInternet {
  
  wget -q --spider http://google.com
  if [ $? -eq 0 ]; then
  echo "Vous avez accès à Internet"
  else
  sleep 5s
  echo "Connectez vous à internet pour éxecuter le script !"
  exit 0
  fi
}   

accessInternet
