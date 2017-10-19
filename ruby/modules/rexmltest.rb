require 'net/http'
require 'rexml/document'

file = File.new( "C:\\Documents and Settings\\rbrindamour\\My Documents\\ExxonMobil\\maintainlocation.txt" )
doc = REXML::Document.new file
print "What is your name?__ "
$name = STDIN.gets
puts "Hi "+$name
doc.elements.each('*/lim-element/lim-element/lim-element')  do |element| 
  if element.attributes['type'] = 'element'
    if !element.elements['domain-binding']
    puts element.attributes['name']
     else puts "bound = " + element.attributes['name']
      end
    end
  end

