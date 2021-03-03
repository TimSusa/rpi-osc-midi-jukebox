#!/bin/sh


CURVOL=`amixer get Master | awk '/Mono.+/ {print $6=="[off]"?$6:$4}' | tr -d '[]'`

echo "Starte: set-volume $CURVOL"


case $1 in
up)
    /usr/bin/amixer -q -c 0 sset 'Master',0 CURVOL=CURVOL+5 
    ;;
down)
    /usr/bin/amixer -q -c 0 sset 'Master',0 CURVOL=CURVOL-5
    ;;
*)
    /usr/bin/amixer -q -c 0 sset 'Master',0 toggle
    ;;
esac



zenity --progress --title "Volume" --window-icon multimedia-volume-control --no-cancel --timeout 1 --width 500  --percentage $CURVOL --text "" --ok-label "Close"
