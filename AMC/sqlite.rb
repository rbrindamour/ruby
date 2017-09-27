require 'rubygems'
require 'sqlite3'

# DBNAME = "/home/rodb/Ruby/SP_500/sp500-data.sqlite"
DBNAME = "/home/rodb/Documents/AMC/Products/salarysurvey.sqlite"

#DBNAME = "/home/rodb/Ruby/SP_500/sp500-data.sqlite"
def median(inarray)
     numbers = inarray.sort
    if (numbers.length%2 == 0)
        then
        (numbers[numbers.length/2 ].to_f +  numbers[numbers.length/2  - 1 ].to_f)/ 2.0
    else
        numbers[numbers.length/2 ].to_i
    end
 end

DB = SQLite3::Database.open( DBNAME )
puts DB

## Select record count
# q = "select Compensation_A,Category_Organization from salarysurvey2014 where Category_Organization = 'Industry'"
# q = "select open from companies_and_stocks"
q = "select Compensation_A from salarysurvey2014 where Category_Organization = 'Charity' and Compensation_A notnull"
q2 = "select Category_Organization,Type_industry_Association, Compensation_A from salarysurvey2014 where Compensation_A notnull
         order by Category_Organization ASC "
results = DB.execute(q)
results2 = DB.execute(q2)

puts "Results is #{results.sort.each {|x| puts x}}"
i = 0; DB.execute(q).each {|wage,assocation_type| results[i] = wage;i+=1}
array = []
total = 0
results.each {|x| if x then array << x; total = total + x end}
puts results2.class
results2.each {|e,f,g| print e, " \t",f,"\t",g,"\n"  }
puts "Sum array = #{total}"
puts "median = #{median(array)}"
puts ""


