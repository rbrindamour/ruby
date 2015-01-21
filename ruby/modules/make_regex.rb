require 'rexml/document'
require 'find'
	skip_element = [/.*zzz/,
    /field3.*/,
    /r\d+/,
    /.*\d+\"/]
    puts skip_element.to_s.gsub('/,/','|')
    
    