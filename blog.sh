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
          #help

          if [ -e "fichiers/scripts/help.sh" ];then
            /bin/bash fichiers/scripts/help.sh
          else
            echo "File help.sh not found"
          exit 0
          fi 
      fi

