require 'rexml/document'
require 'find'
# 1 set directory as fca.dm 
# 2 adjust regex of fields to be ignored
# 3 run report
# 4 copy/paste console output into Excel, sort output by all three columns then create pivot table. 

# SETUP
 directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkDomain\\model\\etk_fca.dm'
# directory = 'http://svn.dev.make-interactive.com/repos/emetk/ProjectSrc/emetk/etkLim/model'
#  $single_file="C:\\Documents and Settings\\rbrindamour\\workspace\\Report Missing Bindings\\Ruby\\DM_Sample.txt"
#  directory = "C:\\Documents and Settings\\rbrindamour\\workspace\\Report Missing Bindings/Ruby/DM_Sample.txt"

# output file
  $tempfile=File.open("C:\\Temp\\dm_elements.txt",  'w') 
#    
    
#  Initialize
  lim_name = ''
  entity_count = 0
  attribute_count = 0

  def camelToTitle(instring)
  outstring = instring.split(/(?=[A-Z])/).join(" ")
    firstletter = outstring[0..0].capitalize
    outstring = firstletter+outstring[1..99]
  end

Find.find(directory) do |path|
  puts path
  file = File.new( directory )
  doc = REXML::Document.new file
       doc.elements.each('domain-model/entity') {|elem| 
#         if (elem.attributes['name'] =~ /Obsolete.*/) 
#         if (elem.attributes['name'] == "Module") 
       if (elem.attributes['name'] =~ /^Module$/) 
          $tempfile.puts elem.attributes['name']
          entity_count += 1       
          elem.elements.each('property') {|attribute| $tempfile.puts "\t #{camelToTitle(attribute.attributes['name'])}" 
          attribute_count += 1
          }
       end
       }
#    end
#  end
#end
end

  puts "finished! entities = #{entity_count} \t attributes = #{attribute_count}"