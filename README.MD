# Remote Decoder 

## W.I.P 

####Designed for Raspberry Pi 3 B(+) on [Raspbian Stretch Lite](https://www.raspberrypi.org/downloads/raspbian/)

### Hardware Required

 - Raspberry Pi 3 B(+)
 - At least an 8GB microSD card
 - Working internet connection 

### Ruby Gems Used 

 - Nokogiri
 - If you have a local copy of the GEM, you can install with 'gem install --local path_to_gem/filename.gem'

## Setup 
 1. Download [Raspbian Stretch Lite](https://www.raspberrypi.org/downloads/raspbian/) Image
 2. Burn image to microSD card using [Etcher](https://etcher.io)
 3. Log in with default credentials Username: Pi Password: Raspberry
 4. Enter the following 
	 + `sudo raspi-config`
	 + Option 4: Option 1 - Choose your location
		 + en_US.UTF-8 UTF-8
	 + Option 4: Option 2 - Change timezone
		 + US -> Eastern
	 + Option 4: Option 3 - Change Keyboard Layout
		 + Generic XXX-key PC
		 + English (US)
		 + "The default for the keyboard layout"
		 + "No compose key"
	 + Option 4: Option 4- Change wifi country
		 + US United States
	 + Option 7: Option 3- Memory Split
		 + Enter 256 
	 + Option 7: Option 1- Expand Filesystem
	 + Option 5: Enable Option 2 for SSH if required.
	 + Reboot Raspberry-Pi (CTRL+ALT+DEL or other options)
 5. Enter the following `sudo passwd root`
 6. *Choose a secure password for root then* `logout`
 7. Replace 'newname' with a new username
	 + `usermod -l newname pi`
	 + `usermod -m -d /home/newname newname`
	 + *Logout and log back in as the new username*
	 + *Change the password* `passwd`
 8. Configure your internet connection then perform the following (You can do this with `sudo ifconfig`)
	 + This internet setting is lost upon reset.
 9. You can set permanent interface settings in `sudo nano /etc/network/interfaces`
 10. `sudo apt-get update`
 11. `sudo apt-get upgrade` 
 12. Disable root account
	 + `sudo passwd -l root`
	 + `sudo visudo`
	 + Under root add the following
	 + `newname ALL=(ALL:ALL) ALL`
	 + logout and login as newname
 13. Install OMXPlayer
     + `sudo apt-get -y install OMXPlayer`
	 + `sudo apt-get -y install ruby`
	 + `sudo apt-get -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev`
	 + `gem install nokogiri` 
12. Feel free to install git to pull this repository
13. Save the script to an accesible location. 
14. After configuration of the script(if needed) you can run the decoder server with the following command
	+ `rvmsudo ruby MultiDecoder.rb`


## Todo 
+ Cleanup code and debug info
+ Configure Static IP
+ Configure Hostname other than default 'RaspberryPi'
+ Persistent blank screen between video transitions
+ Have important variables stored in files that can be changed via SSH instead of having to change the master script
	+  Log locations
	+  SDP location
	+ SDP format
	+  XML/Node structure for parsing
	+ 200 Response
	+ Listening Port
+ Add logging
+ Add webserver to host logged data.
	+ Display current stream <MC_Address> : <MC_Port>
	+ Last request from <IP>
	+ Hosted on separate port from decoder server's listening port
+ Scripted w/ Ruby 2.3.0

