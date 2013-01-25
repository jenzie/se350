##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: Recipe.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

class Recipe
  def initialize( item, database )
    @name = item.slice!(0)
	@calories = 0
	@ingredients = Array.new # keeps track of unique basic items
	@count = Array.new # keeps track of the count of items in @ingredients
	
	item.slice!(1..(item.length - 1)).each do |ingredient|
	  ingredient.chomp!
	  print "'", ingredient, "'\n"
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
  
  attr_accessor :name, :ingredients
  
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