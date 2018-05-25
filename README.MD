# Remote Decoder #

## W.I.P ##

Scripted w/ Ruby 2.3.0
#### Designed for Raspberry Pi 3 B(+) on [Raspbian Stretch Lite](https://www.raspberrypi.org/downloads/raspbian/)

#### Hardware Required
+ Raspberry Pi 3 B(+)
+ At least an 8GB microSD card
+ Working internet connection 

#### Ruby Gems Used 
+ Nokogiri
+ If you have a local copy of the GEM, you can install with 'gem install --local path_to_gem/filename.gem'

### Setup ###
+ Download Raspbian Stretch Lite Image
+ Burn image to microSD card using [Etcher](https://etcher.io)
+ Log in with default credentials Username: Pi Password: Raspberry
+ Enter the following
..+ `sudo passwd root`
..+ *Choose a secure password for root*
..+ `logout`
..+ *Replace 'newname' with a new username
..+ `usermod -l newname pi`
..+ `usermod -m -d /home/newname newname`
..+ *Logout and log back in as the new username*
..+ *Change the password*
..+ `passwd`

+ Configure your internet connection then perform the following (You can do this with `sudo ifconfig`)
+ This internet setting is lost upon reset.
+ You can set permanent interface settings in `sudo nano /etc/network/interfaces`
..+ `sudo apt-get update`
..+ *Disable root account*
..+ `sudo passwd -l root`
..+ `sudo visudo`
..+ *under root add the following-* 
..+ `newname ALL=(ALL:ALL) ALL`
..+ *logout and login as newname*
..+ *Install OMXPlayer*
..+ `sudo apt-get -y install OMXPlayer`
..+ `sudo apt-get -y install ruby`
..+ `sudo apt-get -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev`
..+ `gem install nokogiri` 
..+ *Feel free to install git to pull this repository*
..+ Save the script to an accesible location. 
..+ *After configuration of the script(if needed) you can run the decoder server with the following command*
..+ `rvmsudo ruby MultiDecoder.rb`

### Possible Bugs ###

If you receive an error while trying to install Nokogiri, run:
+ sudo apt-get update
+ sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
+ gem install nokogiri

### Todo ###

+ Persistent blank screen between video transitions
+ Have important variables stored in files that can be changed via SSH instead of having to change the master script
..+ Log locations
..+ SDP location
..+ SDP format
..+ XML/Node structure for parsing
..+ 200 Response
..+ Listening Port
+ Add logging
+ Add webserver to host logged data.
..+ Display current stream <MC_Address> : <MC_Port>
..+ Last request from <IP>
..+ Hosted on separate port from decoder server's listening port

