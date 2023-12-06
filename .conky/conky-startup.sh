#!/bin/sh

if [ "$DESKTOP_SESSION" = "xfce" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/conky-lililo"
   conky -c "$HOME/.conky/conky-lililo/conkyrc_new" &
   exit 0
fi
