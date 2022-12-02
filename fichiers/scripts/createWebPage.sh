#!/bin/bash
function createWebPage {
  if [ -e "index.html" ]; then
   rm index.html
  fi  
  touch index.html  
  cat fichiers/startPageContent.txt >> index.html  

  declare -a extensions=( "JPG" "jpg" "jpeg" "JPEG" "PNG" "png" )
  for f in  images/*.*
  do
    file="$f"
    ext=${file#*.}
    if [[ " ${extensions[*]} " =~ $ext ]]; then
      echo "<div class='col col-md-4' >
	    <img style='height: 300px; width: 300px;margin: 10px;'  src='""$file""'>
            </div>
            <br>" >> index.html  
    fi  
  done

  echo "</div>
        <br>
      <h1>les articles</h1>
      <div class='container row'>">>index.html

      nb_line=$(wc -l < fichiers/database.csv)
      declare -a array_article
      declare -a array_image
      for ((i=1; i<=$nb_ligne; i++)) ;
      do 
      array_article[$i]=$(awk 'BEGIN{FS=";";OFS="\n"} FNR=='$i'{print $1;exit}' fichiers/database.csv)
      array_image[$i]=$(awk 'BEGIN{FS=";";OFS="\n"} FNR=='$i'{print $2;exit}' fichiers/database.csv)
      done      

      for ((i=1; i<=$nb_line; i++)) ;
      do
        echo "<div class='col col-md-4' >">>index.html  

      if [ "${array_image[$i]}" = "null" ];then :
       else 
        echo "<img style='height: 300px; width: 300px;margin: 10px;'  src='""fichiers/articles/images/${array_image[$i]}""'>">>index.html 
       fi

        echo "<p  style=' width: 300px;margin: 10px;'>">>index.html
        cat "fichiers/articles/${array_article[$i]}" >> index.html
        echo "</p>
             </div>
              <br>">>index.html
      

      done    


  echo "</div>">>index.html

  cat fichiers/endPageContent.txt >> index.html 
}


createWebPage
