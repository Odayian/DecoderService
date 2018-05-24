#Creates a OMXPlayer service

require 'daemons'
require 'io/console'

loop do
	puts "Service Starting"
	exec("omxplayer '/tmp/stream.sdp' -o hdmi -b -s") #Testing res.... Add -b for black background
	puts "Service Started"
end
