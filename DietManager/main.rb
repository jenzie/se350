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
  printOptions
  
  # use STDIN.gets because .gets defaults input from file (ARGV)
  while command = STDIN.gets.chomp!
    case command
	when "0"
      printAll( db )
	when "1"
	  printName( db )
	when "2"
	  findPrefix( db )
    when "3"
	  newFood( db )
	when "4"
	  newRecipe( db )
	when "5"
	  save( db )
	when "6"
      quit
    else
      puts "Invalid Command."
	end
	printOptions
  end
end

def printOptions
  puts "\nSelect one of the following options.\n"
  puts "  [0] Print All\n  [1] Print Name\n  [2] Find Prefix  
  [3] New Food\n  [4] New Recipe\n  [5] Save\n  [6] Quit\n"
end

def printAll( foodDB )
  puts "\nThere are currently #{foodDB.size} entries in the database.\n\n"
  foodDB.printAll
end

def printName( foodDB )
  puts "Enter the name of the food entry."
  name = STDIN.gets.chomp!.strip
  # makes sure that only the first letter is changed to uppercase
  name = name.slice(0,1).capitalize + name.slice(1..-1)
  foodDB.printName( name )
end

def findPrefix( foodDB )
  puts "Enter the prefix of the food entry."
  prefix = STDIN.gets.chomp!.strip
  foodDB.findAll( prefix )
end

def newFood( foodDB )
  puts "Enter the name of the basic food entry."
  name = STDIN.gets.chomp!.strip
  puts "Enter the number of calories."
  calories = STDIN.gets.chomp!.strip
  foodDB.addFood( name, calories )
end

def quit
  puts "Good bye!"
  exit
end

run