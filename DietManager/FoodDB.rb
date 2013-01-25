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
  def initialize( file )
	@database = Hash.new
	
	if File.readable?( file )
	  File.open( file , "r" ).each do |line|
		item = line.split(",")
		@database[ item[0] ] = createItem( item )
	  end
	else
	  # ARGV = ["FoodDB.txt", "DietLog.txt"]
	  puts "Usage: ruby main.rb database.txt log.txt"
	end
  end
  
  def size
    @database.size
  end
  
  def createItem( item )
	if item[1].eql?("b")
	  return BasicFood.new( item[0], item[2] )
	else if item[1].eql?("r")
	  return Recipe.new( item, @database )
	end
  end
  
  def printAll
    @database.each do |key, value|
	  if value != nil
	    if value.kind_of? BasicFood
	      value.printItem(1)
	    else
	      value.printItem
		end
	  end
	end
  end
  end
  
  ##
  # For testing purposes only.
  # Getter for @database
  ##
  attr_accessor :database
  
end # end class