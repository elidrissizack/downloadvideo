#!/bin/bash
search=$(yad --title='Recherche web' --text='Tapez votre recherche' --text-align="center" --no-escape --mouse --undecorated --skip-taskbar --on-top \
--form \
--field="recherche:" '' \
--field="Moteur:CB" 'Facebook!^YoutubeMp3')
lien=$(echo $search | awk 'BEGIN {FS="|" } { print $1 }')
fboryt=$(echo $search | awk 'BEGIN {FS="|" } { print $2 }')
if [ "$fboryt" = "Facebook" ]
then
cd /home/ships/Vidéos/Facebook
rech=$(echo "$lien" | sed 's/^/+/;s/ /+/g')
youtube-dl "$lien"
elif  [ "$fboryt" = "YoutubeMp3" ]
then
cd /home/ships/Musique
rech=$(echo "$lien" | sed 's/^/+/;s/ /+/g')
youtube-dl --extract-audio --audio-format mp3 "$lien"
fi
