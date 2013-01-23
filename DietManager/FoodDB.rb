##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: FoodDB.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './Recipe.rb'
require './BasicFood.rb'

class FoodDB
  def initialize?( file )
	@database = Hash.new
	
	if File.file?( file )
	  File.open( file , "r" ).each do |line|
		item = line.split(",")
		database[ item[0] ] = createItem( item )
	  end
	  File.close
	else
	  # ARGV = ["ruby", "main.rb", "FoodDB.txt", "DietLog.txt"]
	  puts "Usage: ", ARGV[1], " database.txt log.txt"
	end
  end
  
  def createItem( item )
	if item[1].eql?("b")
	  return BasicFood.new( item[0], item[2] )
	else if item[1].eql?("r")
	  return Recipe.new( item )
	end
  end
  
  def printAll
    @database.each{ |key, value| value.print }
	end
  end
  
end # end class