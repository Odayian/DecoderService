require 'io/console'
# update system
puts "Updating Repositories"
Process.system('sudo apt-get update')
puts "Repositories Updated"
puts "Installing Ruby"
#install ruby
Process.system('sudo apt-get -y -q install ruby')
puts "Ruby Installed"
puts "Installing Nokogiri Gem Dependencies"
#install nokogiri dependencies
Process.system('sudo apt-get -y -q install build-essential patch ruby-dev zlib1g-dev liblzma-dev')
puts "Nokogiri Gem Dependencies Installed"
puts "Installing Nokogiri"
#install nokogiri
Process.system('sudo gem install nokogiri')
puts "Nokogiri Installed"

