#!/bin/bash

/home/pi/.local/bin/touchosc2midi &

echo "Start Touch-OSC-MIDI..."

sleep 3

/home/pi/bin/rpi-midi-space/midi-monitor.sh &
/home/pi/bin/rpi-midi-space/midi2task.sh &
