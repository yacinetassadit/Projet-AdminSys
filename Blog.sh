#!/bin/bash
touch index.html
cat > index.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <title>New Page</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
  </body>
</html>

EOF
x-www-browser index.html
