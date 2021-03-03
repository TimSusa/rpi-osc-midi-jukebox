#!/bin/bash

#
declare TMPS
#declare CURVOL

aseqdump -p 130:0 | \
while IFS=" ," read port  C1 C2  tmp1 C3 C3Val result resVal; do  
   
    case "$C1 $C2 $C3Val" in 
      "Note on 36" ) xdotool key shift+ctrl+Left; notify-send "Volume" "$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))" --icon=dialog-information -t 1000 ;; 
    esac
    case "$C1 $C2 $C3Val" in 
      "Note on 39" ) xdotool key shift+ctrl+Right; notify-send "Volume" "$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))" --icon=dialog-information -t 1000 ;; 
    esac
    case "$C1 $C2 $C3Val" in 
      "Note on 40" ) clementine -t ;;
    esac
    case "$C1 $C2 $C3Val" in 
      "Note on 41" ) clementine -s ;;
    esac
    case "$C1 $C2 $C3Val" in 
      "Note on 42" ) clementine -k 0 ;;
    esac
    case "$C1 $C2 $C3Val" in 
      "Note on 43" ) clementine -k 28 ;;
    esac

done
