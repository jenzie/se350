##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: main.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require 'io/console'
require './FoodDB.rb'

def run
  # ARGV = ["FoodDB.txt", "DietLog.txt"]
  db = FoodDB.new( ARGV[0] )
  
  puts "Welcome to the Diet Manager!"
  puts "\nSelect one of the following options.\n"
  puts "  [P]rint All\n  [Q]uit\n"
  
  # use STDIN.gets because .gets defaults input from file (ARGV)
  while command = STDIN.gets.chomp!.upcase!
    case command
    when "P"
      printAll( db )
    when "Q"
      quit
    else
      puts "Invalid Command."
	end
  end
end

def printAll( foodDB )
  puts "\nThere are currently #{foodDB.size} entries in the database.\n\n"
  foodDB.printAll
end

def quit
  puts "Good bye!"
  exit
end

run