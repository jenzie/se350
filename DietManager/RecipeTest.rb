##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: RecipeTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './FoodDB'
require './Recipe'
require 'test/unit'

##
# Unit tests for Recipe.rb.
##
class RecipeTest < Test::Unit::TestCase

  ##
  # Creates instances of FoodDB, Recipe, and list of recipe information 
  # for succeeding unit tests.
  ##
  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@list1 = ["Egg & Sausage","r","Fried Egg","Fried Egg","Sausage","Sausage"]
	@list2 = ["Muffin with Ham & Egg","r","Ham","Fried Egg","English Muffin"]
	@recipe1 = Recipe.new( @list1, @db.database )
	@recipe2 = Recipe.new( @list2, @db.database )
	@list3 = ["Muffin with Sausage","r","English Muffin","Sausage","Sausage"]
	@recipe3 = Recipe.new( @list3, @db.database )
  end
  
  ##
  # Validates ingredients stored are correct.
  ##
  def test_for_ingredients
    @list1 = @list1.values_at(1..(@list1.length - 1))
    @list1.each do |ingredient|
	  assert( @recipe1.ingredients.include?( @db.database[ ingredient ] ), 
	    "Recipe1 does not contain #{ingredient}." )
	end
	
    @list2 = @list2.values_at(1..(@list2.length - 1))
    @list2.each do |ingredient|
	  assert( @recipe2.ingredients.include?( @db.database[ ingredient ] ), 
	    "Recipe2 does not contain #{ingredient}." )
	end
	
    @list3 = @list3.values_at(1..(@list3.length - 1))
    @list3.each do |ingredient|
	  assert( @recipe3.ingredients.include?( @db.database[ ingredient ] ), 
	    "Recipe3 does not contain #{ingredient}." )
	end
  end
  
  ##
  # Validates calories stored are correct.
  ##
  def test_for_calories
    assert_equal( @recipe1.calories, 320 )
	assert_equal( @recipe2.calories, 180 )
	assert_equal( @recipe3.calories, 240 )
  end
  
  ##
  # Validates that the string for the recipe information will be printed 
  # correctly.
  ##
  def test_for_printItem
    assert_equal( @recipe1.printItem( 0, 1 ),
	  "Egg & Sausage 320\n  Fried Egg (2) 160\n  Sausage (2) 160\n" )
	assert_equal( @recipe2.printItem( 0, 1 ),
	  "Muffin with Ham & Egg 180\n  Ham 20\n  Fried Egg 80\n  English Muffin 80\n" )
	assert_equal( @recipe3.printItem( 0, 1 ),
	  "Muffin with Sausage 240\n  English Muffin 80\n  Sausage (2) 160\n" )
  end

end # end class