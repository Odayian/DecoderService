# Remote Decoder #

## W.I.P ##

Scripted w/ Ruby 2.3.0
#### Designed for Raspberry Pi 3 B(+) on [Raspbian Stretch Lite](https://www.raspberrypi.org/downloads/raspbian/)

#### Gems required 
+ Nokogiri

### Setup ###



If you receive an error while trying to install Nokogiri, run:
- sudo apt-get update
- sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
- gem install nokogiri

Todo:
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

