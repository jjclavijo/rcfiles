#!/bin/zsh

mkdir -p ~/.local/share/fonts/TTF
cd ~/.local/share/fonts/TTF

while read l
do
  curl $l -o tmp.zip
  unzip -o -qq tmp.zip
  rm tmp.zip
done <<EOF
https://fonts.google.com/download?family=Montserrat
https://fonts.google.com/download?family=Julius%20Sans%20One
https://fonts.google.com/download?family=Major%20Mono%20Display
https://fonts.google.com/download?family=Nunito
https://fonts.google.com/download?family=Overpass%20Mono
https://fonts.google.com/download?family=Quicksand
https://fonts.google.com/download?family=Fira%20Code
EOF

curl -J -O https://github.com/smc/Uroob/blob/master/ttf/Uroob.ttf?raw=true

