# **BeagleBone Black Wireless**


[https://beagleboard.org/black-wireless](https://beagleboard.org/black-wireless)


## _Getting started_

Use the provided USB cable to plug your Beagle into your computer.

You'll see the PWR LED lit steadily. Within 10 seconds, you should see the other LEDs blinking in their default configurations.

`USR0` is configured at boot to blink in a heartbeat pattern  
`USR1` is configured at boot to light during microSD card accesses  
`USR2` is configured at boot to light during CPU activity  
`USR3` is configured at boot to light during eMMC accesses  


## _Install drivers_

Install the drivers for your operating system to give you network-over-USB access to your Beagle. Additional drivers give you serial access to your board.

| Operating System | USB Drivers |
| ---------------- | ----------- |
| Windows x64      | 64-bit installer - https://beagleboard.org/static/Drivers/Windows/BONE_D64.exe |
| Windows x86      | 32-bit installer - https://beagleboard.org/static/Drivers/Windows/BONE_DRV.exe |
| Mac OS X         | Network Serial - https://beagleboard.org/static/Drivers/MacOSX/FTDI/EnergiaFTDIDrivers2.2.18.pkg |
| Linux            | mkudevrule.sh - https://beagleboard.org/static/Drivers/Linux/FTDI/mkudevrule.sh |


## _Browse to your Beagle_

Using either Chrome or Firefox (Internet Explorer will NOT work), browse to the web server running on your board. It will load a presentation showing you the capabilities of the board. Use the arrow keys on your keyboard to navigate the presentation.

http://192.168.7.2  
_**Cloud9**_ - http://192.168.7.2:3000  
_**SSH:**_ 192.168.7.2:22  (_default user and password is `debian` : `temppwd`_)


## _Update board with latest software_

Download the desired image from https://beagleboard.org/latest-images

To turn these images into eMMC flasher images, edit the `/boot/uEnv.txt` file on the Linux partition on the microSD card and remove the '`#`' on the line with '`cmdline=init=/opt/scripts/tools/eMMC/init-eMMC-flasher-v3.sh`'. Enabling this will cause booting the microSD card to flash the eMMC. Images are no longer provided here for this to avoid people accidentally overwriting their eMMC flash.

**Flashing with the micro-SD card image:**
1. Edit the `/boot/uEnv.txt`.
2. Power off.
3. Plug the micro-SD card into the micro-SD card slot.
4. Power on.
5. The blue LEDs `USR0` `USR1` `USR2` `USR3` should light in sequence.
6. Wait until the LEDs stop blinking and the board shutdown, indicating successful.
7. Remove micro-SD card and power on the board, that's all.

## _WiFi connection_

```
$> connmanctl

connmanctl> enable wifi
Enabled wifi
or
Error wifi: Already enabled

connmanctl> scan wifi
Scan completed for wifi

connmanctl> services
**Display access points discovered**

for example:
*AO XX-AP1         wifi_xxx_xxxxxxx_managed_psk
    XX-AP2         wifi_xxx_xxxxxxxx_managed_psk

connmanctl> agent on
Agent registered

connmanctl> connect wifi_*_managed_psk
Agent RequestInput wifi_*_managed_psk
  Passphrase = [ Type=psk, Requirement=mandatory ]
Passphrase? xxxxxxxx
Connected wifi_*_managed_psk

connmanctl> quit
```

_**To check the WiFi: **_
```
$> ifconfig wlan0
```

## Change the time zone
```
$> sudo dpkg-reconfigure tzdata
```

## Install Qt5
```
$> sudo apt-get update
$> sudo apt-get upgrade
$> sudo apt-get install qt5-default

$> qmake --version
QMake version 3.0
Using Qt version 5.3.2 in /usr/lib/arm-linux-gnueabihf
```
