##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: BasicFood.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

class BasicFood
  def initialize( name, calories )
    @name = name
	@calories = calories.to_i
  end
  
  attr_accessor :name, :calories
  
  def printItem( count )
    if count == 1
      return "#{@name} #{@calories.to_s}"
    else
	  return "#{@name} (#{count.to_s}) #{( @calories * count ).to_s}"
	end
  end
end #end class