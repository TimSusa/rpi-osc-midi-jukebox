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
- Consider if you have to do other scripts executable via chmod 
- Copy lxde-pi-rc.xml to /etc/xdg/openbox/lxde-pi-rc.xml (this is for configuring volume hotkeys shift+ctrl left or right)
- Use the file: RaspiTouchOsc.touchosc for loading into your touchOSC Application (iOS or Android is supported) see: https://hexler.net/docs/touchosc-configuration-layout-load-and-remove

# Dependencies
- clementine, touchosc2midi, libnotify, aconnect-gui
- https://howchoo.com/pi/raspberry-pi-midi-keyboard-synthesizer
- https://github.com/velolala/touchosc2midi


- 64Bit Realtime Kernel OS: https://forum.linuxcnc.org/9-installing-linuxcnc/39779-rpi4-raspbian-64-bit-linuxcnc

- Touch OSC: https://hexler.net/docs/touchosc-getting-started


# Working as a bluetooth midi server
- This device could act as an additional midi source like keyboard or hardware midi controller
- the other way arround, midi could be send to the device for further internal usage (consider to use Ardour on the rpi for handling MIDI input signals and generating sound on this)
- Bluetooth MIDI Setup: https://neuma.studio/rpi-midi-complete.html (scroll down to bluetooth midi chapter only, forget about the rest)

- Consider to compile the lib for your pi:

``` 
git clone https://github.com/oxesoft/bluez
sudo apt-get install -y autotools-dev libtool autoconf
sudo apt-get install -y libasound2-dev
sudo apt-get install -y libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev
cd bluez
./bootstrap
./configure --enable-midi --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc --localstatedir=/var
make
sudo make install 
``` 

- Now you should be able to start the script:

``` 
sudo /home/pi/bin/start-blt-midi.sh 
``` 

- If all this went fine without any issues, you should be able to see your rpi device in your DAW host on the other side for any MIDI communication. 
--> on Mac you can start the audio/midi tool and open up the bluetooth midi view to see if anything is here
--> Ableton Live should show it as a new driver called: "RPi Bluetooth"
--> on Win this is not tested. 