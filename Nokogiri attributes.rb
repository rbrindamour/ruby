doc_show = Nokogiri::XML(File.open('ruby_workspace/show_xml')
doc_text = File.new('/home/rodb/Documents/Dell/AQHA/equusDomain/model/AQH_V4_Transform.dmt','r')

doc_XML.xpath('//transform//mapping').each {|x| x.attributes.each {|key,value| puts "#{key} > #{value}"}}