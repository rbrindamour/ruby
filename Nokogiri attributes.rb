 require 'rubygems'
 puts RUBY_VERSION
 
 require 'nokogiri'
#doc_show = Nokogiri::XML(File.open('ruby_workspace/show_xml'))
#doc_text = File.new('/home/rodb/Documents/Dell/AQHA/equusDomain/model/AQH_V4_Transform.dmt','r')


 # doc_show.xpath("//transform").each {|x| puts x.attributes}
 # doc_show.xpath("//transform").each {|x| puts x.elements}
 # use remove_namespaces! to remove the namespace so that it parses as expected
 doc_xml = Nokogiri::XML(File.open('/home/rodb/Documents/Dell/AQHA/equusDomain/model/AQH_V4_Transform.dmt','r'))
 doc_xml.remove_namespaces!
 doc_xml.xpath('//transform//mapping').each {|x| x.attributes.each {|key,value| puts "#{key} > #{value}"}}
 
 doc_xml.xpath("//transform").each {|x|  x.attributes.each {|y| puts y if y.to_s.match(/EQ-/)}}
 doc_xml.xpath("//transform").each {|x|  x.attributes.each {|y| puts y}}