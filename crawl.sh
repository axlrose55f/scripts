#!/bin/bash
GOOGLEBOT_USERAGENT_STRING="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
ROOT_URL="http://movietalkies.com/artiste-filmography"
current=65853
i=39348
while [ $i -lt $current ]
do
  ((i++))
  echo "$ROOT_URL"/$i"/artist"
  wget -w 1 --random-wait -E  --quiet --user-agent="$GOOGLEBOT_USERAGENT_STRING" --referer=http://movietalkies.com/ --cookies=on --load-cookies=cookie.txt --keep-session-cookies --save-cookies=cookie.txt "$ROOT_URL/$i/artist"
done 

