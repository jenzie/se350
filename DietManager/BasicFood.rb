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
	@calories = calories
  end
  
  attr_accessor :name, :calories
  
  def print
    puts @name + " " + @calories
  end
end #end class