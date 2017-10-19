#!/usr/bin/ruby1.9.3
require 'rubygems'
require 'mysql'

begin
    con = Mysql.new 'localhost', 'user12', '34klq*'

    con.list_dbs.each do |db|
        puts db
    end
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
