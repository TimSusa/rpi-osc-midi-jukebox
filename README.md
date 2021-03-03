# rpi-osc-midi-jukebox
Turn your raspberry pi into a self running music jukebox, which is full controllable via OSC and MIDI. iOS and Android Controls supported 

# Features 
- auto start and connection of touch osc to midi bridge
- auto start music player with playlist from soma fm
- possibility to start btm as bluetooth midi host (see script start-blt-midi.sh)

- This was configured with a 64Bit Raspberian Realtime Kernel, so you should take care of installing failing dependencies for yourself

# Configuration
- Copy the content of pi-home into your home folder of the raspberry pi (do not overwrite your own home!)
- Copy the script: start-midi-space.sh with sudo to /usr/bin
- Copy lxde-pi-rc.xml to /etc/xdg/openbox/lxde-pi-rc.xml (this is for configuring volume hotkeys shift+ctrl left or right)
- Use the file: RaspiTouchOsc.touchosc for loading into your touchOSC Application (iOS or Android is supported)

# Dependencies
- clementine, touchosc2midi, libnotify