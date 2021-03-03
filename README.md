<p align="center">
  <img width="10%" src="./docs/rpi.webp">
  <img width="10%" src="./docs/clementine.png">
  <img width="10%" src="./docs/touchosc.png">
  <img width="10%" src="./docs/midi.jpg">
  <img width="10%" src="./docs/blt.png">
  <img width="10%" src="./docs/midi-bricks.png">
</p>

# rpi-osc-midi-jukebox
Turn your raspberry pi into a self running music jukebox, which is fully controllable via OSC and MIDI. iOS and Android Controls supported 

# Features 
- self running music jukebox, with self repeating playlist from soma fm (configurable)
- music player remote control via TouchOSC App (iOS, Android, see loading layout below)
- possibility to start the device as bluetooth midi host for DAW remote usage

# First Steps
- Clone this repo into your raspberry pi home folder

``` 
git clone https://github.com/TimSusa/rpi-osc-midi-jukebox.git 
cd rpi-osc-midi-jukebox
``` 

- Add the content of pi-home into your home folder of the raspberry pi (Do this on your own risk!)
```
cp -r pi-home/* $HOME/
```

- Copy the main service script:
- have a look at .config/autostart/autostart-start-osc-midi-bridge.desktop which is used to start the service from /usr/bin
```
sudo cp $HOME/start-midi-space.sh  /usr/bin
```

- In order to change the volume via keyboard keys do the following:
- Copy over the lxde Configuration (only if you have no personal dependencies here, be careful!):
- On your keyboard keys, now you can change volume via hotkeys shift+ctrl left or right to increase or decrease the volume
- Furthermore, this enables the remote scripts to react on volume changes via extern osc or midi signals

``` 
sudo cp $HOME/lxde-pi-rc.xml /etc/xdg/openbox/
```  

# Dependencies
- At first, please install dependencies on command line, to have basic functionality available:

```
sudo apt-get install -y clementine libnotify xdotool aconnectgui
```

- https://howchoo.com/pi/raspberry-pi-midi-keyboard-synthesizer
- https://github.com/velolala/touchosc2midi


- 64Bit Realtime Kernel OS: https://forum.linuxcnc.org/9-installing-linuxcnc/39779-rpi4-raspbian-64-bit-linuxcnc

- Touch OSC: https://hexler.net/docs/touchosc-getting-started

## Remote Control with TouchOSC
- Please consider, TouchOSC costs money, otherwise if you deny to use commercial software, please have a look at Open Stage Control: https://openstagecontrol.ammd.net/ (Feedback is welcome!)
- However, for TouchOSC, just use the file: RaspiTouchOsc.touchosc for loading into your touchOSC Application (iOS or Android is supported) see: https://hexler.net/docs/touchosc-configuration-layout-load-and-remove

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


# Working as MIDI Controller Source
- Consider to have a look at midi bricks:
https://github.com/TimSusa/midi-bricks
- Install for Raspberry Pi can be found here: https://github.com/TimSusa/midi-bricks/releases
- Chose the *.arm7.AppImage File for download
- Make the file executable on commandline:
``` 
chmod +x midi-bricks*.AppImage
./midi-bricks*.AppImage
```  

- No you can start the application via double click
- After starting the application enable the drivers first (see simple button in the app)

