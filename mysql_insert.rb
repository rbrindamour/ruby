#!/usr/bin/ruby1.9.3
require 'rubygems'
require 'mysql'

begin
    
    con = Mysql.new 'localhost', 'user12', '34klq*', 'mydb'
    
    puts con
   
    con.query("CREATE TABLE IF NOT EXISTS \
        Writers(Id INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(25))")
    con.query("INSERT INTO Writers(Name) VALUES('John London')")
    con.query("INSERT INTO Writers(Name) VALUES('Honor de Balzac')")
    con.query("INSERT INTO Writers(Name) VALUES('Leon Feuchtwanger')")
    con.query("INSERT INTO Writers(Name) VALUES('Emile Zolo')")
    con.query("INSERT INTO Writers(Name) VALUES('Truman Capot')")   
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
