require 'rexml/document'
require 'find'
# 1 set directory as top folder of LIMs to be reported 
# 2 adjust regex of fields to be ignored
# 3 run report
# 4 copy/paste console output into Excel, sort output by all three columns then create pivot table. 

# SETUP
project = 
  'C:\\project\\Exxon\\etkLim\\model'
# 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model'
#folder = 
# 'fabricatedModules'
# 'dataEntryEquipment'
# 'bulk_And_Other'
# 'equipment'
# 'estimating'
directory = project
# directory = 'C:\\Documents and Settings\\rbrindamour\\workspace\\ExxonMobil\\emetk\\etkLim\\model'
# directory = 'http://svn.dev.make-interactive.com/repos/emetk/ProjectSrc/emetk/etkLim/model'
  $single_file=""

# output file
$tempfile=File.open("C:\\Temp\\bindings.txt",  'w') 
#  
#  $single_file="enterEditFurnace"
  doc = REXML::Document.new directory
  puts "First doc #{doc[0..10]}"
  skip_lim = [
#    /.*maintainReciprocating.*/,
#    /.*reportAdHocInformation.*/,
#    /.*reportEstimateRelatedInformation.*/,
#    /.*analyzeUpdateCostUpdateBaseWageSubcontractorRate.*/,

#    /.*analyzeUpdateCostUpdateEngineeringRate.*/,
#    /.*maintainAreaBasis.*/,
#    /.*maintainDCSIHardware.*/,
#    /.*CentrifugalCompressor.*/,
    ]
#  skip_element = [/.*zzz/
#    /field3.*/,
#    /r\d+/,
#    /.*\d+\"/
#    ]    
    
#  Initialize
  lim_name = ''

  def camelToTitle(instring)
  outstring = instring.split(/(?=[A-Z])/).join(" ")
    firstletter = outstring[0..0].capitalize
    outstring = firstletter+outstring[1..99]
end
  
def find_element(current_lim,current_element)
   if current_element.attributes['type'] == 'element'  
    if !current_element.elements['domain-binding']
#      if (current_element.attributes['name'] =~ /(.*zzz|field3.*)/ )        
#      if (current_element.attributes['name'] =~ /(.*zzz|field3.*|r\d+|.*\d+\b)/ )        
#        if (current_element.attributes['name'] =~ /(.*zzz|field3.*|r\d+|row\d+|.*Default\d+|.*Temperature\d+|.*updatedBy\d+|.*sequenceStatus\d+|.*lastUpdatedOn\d+|.*button\d+|.*Units\d+|.*Mixed\d+)/ )        
        if (current_element.attributes['name'] =~ /.*zzz/) or 
#           (current_element.attributes['name'] =~ /field3.*/) or
#           (current_element.attributes['name'] =~ /r\d+/) or 
           (current_element.attributes['name'] =~ /.*\d+\b/)         
       else
        if $single_file == ""
          $tempfile.puts "Not bound \t #{current_lim} \t #{current_element.attributes['name']}"
#          outbindings.write( "Not bound \t #{current_lim} \t #{current_element.attributes['name']}")
          else
           if current_lim == $single_file
             $tempfile.puts "Not bound \t #{current_lim} \t #{current_element.attributes['name']}"
#             outbindings.write(  "Not bound \t #{current_lim} \t #{current_element.attributes['name']}")
           end
        end
      end
      else
         current_element.elements.each('domain-binding') { |binding|
         if $single_file == ""
           $tempfile.puts "bound\t#{current_lim}\t#{binding.attributes['entity-name']}.#{binding.attributes['property-name']}\t#{camelToTitle(current_element.attributes['name'])}"
#           outbindings.write("bound\t"+current_lim+"\t"+binding.attributes['entity-name']+"."+binding.attributes['property-name']+"\t"+camelToTitle(current_element.attributes['name']))
           else
            if current_lim == $single_file
              $tempfile.puts "bound\t#{current_lim}\t#{binding.attributes['entity-name']}.#{binding.attributes['property-name']}\t#{camelToTitle(current_element.attributes['name'])}"
#              outbindings.write( "bound\t#{current_lim}\t#{binding.attributes['entity-name']}.#{binding.attributes['property-name']}\t#{camelToTitle(current_element.attributes['name'])}")
           end
         end
         }
        
    end
  else 
     current_element.elements.each('lim-element') { |lower_elem| 
     find_element(current_lim,lower_elem) 
     }
   end 
end
 
$tempfile.puts "Bound/Not Bound \t LIM Name \t Binding/Element Name" 

Find.find(directory) do |path|
  if File.basename(path)[0] =~ /.*-.*/
     Find.prune
  end
  
  skip_lim.each() {|filename|
 if File.basename(path,".lim") =~ filename
     Find.prune
 end
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
      doc.elements.each('lim/lim-element') { |elem| find_element(lim_name,elem)}
    end
  end
end
end

  puts "finished!"