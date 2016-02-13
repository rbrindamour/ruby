 infile = File.new("/home/rodb/Documents/Dell/CJIMS/Conditions Text JAIN.txt","r")
i = 1
infile.each {|record|
     key,jain,cjims = record.split("\t")
     puts "key >> #{key[0..20]} jain ==== #{jain.gsub("\/n"," ")} cjims === #{cjims.gsub("\/n"," ")}" #if (100..110) === i
     i +=1
#      if (jain.gsub("\n","") != cjims) then puts record.length,key.length,jain.length,cjims.length end
     }
