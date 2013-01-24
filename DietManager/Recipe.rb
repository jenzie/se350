##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: Recipe.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

class Recipe
  def initialize( item )
    @name = item.slice!(0)
	@ingredients = item.slice!(2..(item.length - 1))
  end
  
  attr_accessor :name, :ingredients
  
  def print
    printf @name + "\n"
	@ingredients.each{ |item| puts "\t" + item }
	end
	puts "\n"
end # end class