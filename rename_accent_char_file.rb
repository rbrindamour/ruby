
puts RUBY_VERSION
puts "$load path is #{`$LOAD_PATH`} !"
puts require 'rubygems'
puts require 'rails'
puts require 'rake'
#puts require 'test/unit'
puts require 'nokogiri'
#puts require 'iconv'
puts RUBY_VERSION
folder_path = "/home/rodb/Temp/ToRename"
puts "folder path is ..  #{folder_path}"
Dir.glob(folder_path + "/**.*").each do |f|
  puts f
  filename = File.basename(f, File.extname(f))
  File.rename(f, folder_path + I18n.transliterate(filename) + File.extname(f))
  puts f
end