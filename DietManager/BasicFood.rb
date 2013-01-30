##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: BasicFood.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

##
# BasicFood
# Stores information for a basic food entry.
##
class BasicFood
  
  ##
  # Constructor for BasicFood
  # initialize: String * Integer -> void
  # name:       name of the food
  # calories:   number of calories in the food
  ##
  def initialize( name, calories )
    @name = name
	@calories = calories.to_i
  end
  
  ##
  # Getters for BasicFood.name, BasicFood.calories
  ##
  attr_accessor :name, :calories
  
  ##
  # Returns a string containing the name, total calories, and count 
  # for the food entry.
  ##
  def printItem( count )
    if count == 1
      return "#{@name} #{@calories.to_s}\n"
    else
	  return "#{@name} (#{count.to_s}) #{( @calories * count ).to_s}\n"
	end
  end
  
end #end class