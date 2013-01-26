##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: Recipe.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

class Recipe

  ##
  # Constructor to create an instance of Recipe.
  # initialize: ArrayOfStrings * FoodDB -> void
  # item:     array of strings containing the name and ingredients for the recipe
  #           Format: ["name","r","ingredient_1","ingredient_2",...]
  # database: instance of FoodDB; used to convert individual ingredients into 
  #           their instances of BasicFood in the database.
  ##
  def initialize( item, database )
    @name = item.slice!(0)
	@calories = 0
	@ingredients = Array.new # keeps track of unique basic items
	@count = Array.new # keeps track of the count of items in @ingredients
	
	item.slice(1..(item.length - 1)).each do |ingredient|
	  ingredient.chomp!
	  ingredient = ingredient.slice(0,1).capitalize + ingredient.slice(1..-1)
	  if !database.include?( ingredient )
	    puts "Error: Invalid ingredient '" + ingredient + 
		  "' for the recipe '" + @name + "'.\n"
		exit
	  elsif ingredients.include?( database[ ingredient ] )
	    @count[ ingredients.index( database[ ingredient ] ) ] += 1
	  else
	    @ingredients << database[ ingredient ]
		@count << 1
	  end
	  @calories += database[ ingredient ].calories
	end
  end
  
  ##
  # Getters for @name, @ingredients
  ##
  attr_accessor :name, :ingredients, :calories
  
  ##
  # Method to print the name, calories, and ingredients for the recipe.
  # Multiples of ingredients are printed once with their count.
  ##
  def printItem
    index = 0
    print @name, " ", @calories, "\n"
	@ingredients.each do |item|
	  print "  "
	  item.printItem( @count[ index ] )
	  index += 1
	end
  end
  
end # end class