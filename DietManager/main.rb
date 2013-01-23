##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: main.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './FoodDB.rb'

def run
  # ARGV = ["ruby", "main.rb", "FoodDB.txt", "DietLog.txt"]
  db = FoodDB.new( ARGV[2] )
  
  puts "Welcome to the Diet Manager!"
  puts "\nSelect one of the following options."
  puts "\t[P]rint All\n
	    \t[Q]uit\n"
  
  command = gets.upcase!
  case command
  when command.eql?("P")
    printAll
  when command.eql?("Q")
    quit
  else
    puts "Invalid Command."
  end
end

def printAll
  DB.printAll
end

def quit
  puts "Good bye!"
  exit
end