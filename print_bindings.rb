require 'rexml/document'
require 'find'
# 1 set directory as top folder of LIMs to be reported 
# 2 adjust regex of fields to be ignored
# 3 run report
# 4 copy/paste console output into Excel, sort output by all three columns then create pivot table. 

# SETUP
  directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model\\fabricatedModules'
#directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model\\estimating'
#directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model\\bulk_And_Other'
#directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model\\equipment'
#directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model\\estimating\\reciprocatingCompressorTabs'
  puts directory
# directory = 'http://svn.dev.make-interactive.com/repos/emetk/ProjectSrc/emetk/etkLim/model'
  doc = REXML::Document.new directory
  include_lim = [
    /.*/]
  skip_element = [/.*zzz/,
    /field3.*/,
    /r\d+/,
    /.*\d+\"/]
    
    
#  Initialize
  lim_name = ''

  def camelToTitle(instring)
    outstring = instring.split(/(?=[A-Z])/).join(" ")
    firstletter = outstring[0..0].capitalize
    outstring = firstletter+outstring[1..99]
  end

def find_element(skip_el,current_lim,current_element)
   if current_element.attributes['type'] == 'element'  
    if !current_element.elements['domain-binding']
#      if !skip_el.each() {|element|
#      current_element.attributes['name'] =~ element }
#        puts "bad element found = #{element}"
#      if (current_element.attributes['name'] =~ /(.*zzz|field3.*|r\d+|.*\d+\b)/ )  
#        puts "skipping #{current_element.attributes['name']}"      
#        if (current_element.attributes['name'] =~ /.*zzz/) or 
#           (current_element.attributes['name'] =~ /field3.*/) or
#           (current_element.attributes['name'] =~ /r\d+/) or 
#        if (current_element.attributes['name'] =~ /.*\d+.+\b/)  
      else
      if (current_element.attributes['name'] =~ /(.*zzz|.*\d+\b)/ )
      else  
          current_element.elements.each('domain-binding') { |binding|
            if current_element.attributes['label']
              display_label = current_element.attributes['label']
            else display_label = camelToTitle(binding.attributes['property-name'])
            end
         puts "#{current_lim}\t#{binding.attributes['entity-name']}.#{binding.attributes['property-name']}\t#{display_label}"
         }
      end
    end
  else 
     current_element.elements.each('lim-element') { |lower_elem| 
     find_element(skip_el,current_lim,lower_elem) 
     }
   end 
end
 
puts "LIM \t Entity.Attribute" 

Find.find(directory) do |path|
  if File.basename(path)[0] =~ /.*-.*/
     Find.prune
  end
  include_lim.each() {|filename|
# if File.basename(path,".lim") =~ filename
#     Find.prune
#  end
  }
  if File.ftype(path) != 'link'
    if File.extname(path) == '.lim'
    if FileTest.directory?(path)
      if File.basename(path)[0] == ?.
        Find.prune       # Don't look any further into this directory.
      else
        next
      end
    else 
      file = File.new( path )
      doc = REXML::Document.new file
      doc.elements.each('lim') {|element| lim_name = element.attributes['name']}
      doc.elements.each('lim/lim-element') { |elem| find_element(skip_element,lim_name,elem)}
    end
  end
end
end