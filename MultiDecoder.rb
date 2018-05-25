
# Dependencies 
require 'socket'
require 'nokogiri'
require 'io/console'

# Global variables
current_address = "" # Store currently streaming IP address
current_port = "" # Store currently streamping IP address' port
data = "" # Store packet
headers = {} # Header storage
stream_pid = nil #Store PID for stream
server = TCPServer.new 80  # Socket to listen on port 80
puts "Server Started"
loop do
    session = server.accept
	request = session.gets
	puts request
	session.print "HTTP/1.1 200\r\n"
	session.print "Content-Type: text/html\r\n"
	session.print "\r\n"
	session.print ""
	
	
	while line = session.gets.split(' ', 2)              # Collect HTTP headers
		break if line[0] == ""                            # Blank line means no more headers
		headers[line[0].chop] = line[1].strip             # Hash headers by type
	end
	data = session.read(headers["Content-Length"].to_i)  # Read the POST data as specified in the header
	xml_doc = Nokogiri::XML(data) # Store XML data into xml_doc. Will be processed by Nokogiri Gem

	puts "Data Received"
	
	############# Data Handler
	puts "Inside Data Handler"
	if !(xml_doc.at_css("DigitalVideoSettings Channel MulticastSettings VideoIP").nil?) # Validate contents before parsing
		multi_address = xml_doc.at_css("DigitalVideoSettings Channel MulticastSettings VideoIP")["value"]# Sets multi_address to parsed data
		multi_port = xml_doc.at_css("DigitalVideoSettings Channel MulticastSettings VideoPort")["value"]# Sets multi_port to parsed data
		# Validates new stream
		############# Stream Handler
		puts "Inside Stream Handler"
		if (multi_address != current_address) && (multi_port != current_port)
			File.open("/tmp/stream.sdp","w") do |f2|
			f2.puts "v=0\n" +
				"m=video #{multi_port} RTP/AVP 96\n" +
				"a=rtpmap:96 H264/90000\n" +
				"c=IN IP4 #{multi_address}\n" +
				"a=fmtp:96 packetization-mode=1;profile-level-id=42001E;sprop-parameter-sets=Z0KAHtoFh8Q=,aM48gA==\n" 
			end
			
			# Set variables to new values	
			last_request = request
			current_address = multi_address
			current_port = multi_port
			File.open("/tmp/sincereboot.log","a") do |f3|
			f3.puts "TIME: #{Time.now} | Last Request: #{last_request} | Address: #{current_address} | Port: #{current_port}\r\n"
			end
			puts "Stream PID: #{stream_pid}"
			
			if stream_pid != nil 
				puts "Not Nil Pid"
				stream_pid = `pidof omxplayer.bin`
				puts "Killing old stream with pid: #{stream_pid}"
				Process.kill('INT', stream_pid.to_i)
			elsif stream_pid == nil
				puts "Nil PID"
			end
			
			puts "Connecting to #{current_address} on port #{current_port}" 
			puts "Decoder Service Restarting"
			Process.fork do
				# Creates decoded stream. Persists even after application crash. -o <output> ; -b : black screen behind video ; -s : display stats in console
				Process.exec("omxplayer '/tmp/stream.sdp' -o hdmi -s -b")
			end
			stream_pid = 9999 # One time use faux-PID
			puts "Decoder Service Restarted"
		end		
	end
end
