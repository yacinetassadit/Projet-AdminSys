#!/bin/bash
function createWebPage {
  if [ -e "index.html" ]; then
   rm index.html
  fi  
  touch index.html  
  cat fichiers/startPageContent.txt >> index.html  

  declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
  for f in  Images/*.*
  do
    file="$f"
    ext=${file#*.}
    if [[ " ${extensions[*]} " =~ $ext ]]; then
      echo "<div class='w3-row-padding w3-padding-16 w3-center' id='picture'>
	    <img style="width:100%"  src='""$file""'>
            </div>
            " >> index.html  
    fi  
  done
      nb_line=$(wc -l < fichiers/database.csv)
      declare -a array_article
      declare -a array_image
      for ((i=1; i<=$nb_line; i++)) ;
      do 
      array_article[$i]=$(awk 'BEGIN{FS=";";OFS="\n"} FNR=='$i'{print $1;exit}' fichiers/database.csv)
      array_image[$i]=$(awk 'BEGIN{FS=";";OFS="\n"} FNR=='$i'{print $2;exit}' fichiers/database.csv)
      done      

      for ((i=1; i<=$nb_line; i++)) ;
      do
        echo "<div class="w3-row-padding w3-padding-16 w3-center" id="picture">">>index.html  

      if [ "${array_image[$i]}" = "null" ];then :
       else 
        echo "<img style='width:100%'  src='""fichiers/Images_articles/${array_image[$i]}""'>">>index.html 
       fi

        echo "<p>">>index.html
        cat "fichiers/articles/${array_article[$i]}" >> index.html
        echo "</p>
             </div>
              <br>">>index.html
      

      done    

  cat fichiers/endPageContent.txt >> index.html
  x-www-browser index.html 
}


createWebPage
