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
require './BasicFood'
require 'test/unit'

class RecipeTest < Test::Unit::TestCase

  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@list1 = ["Egg & Sausage","r","Fried Egg","Fried Egg","Sausage","Sausage"]
	@list2 = ["Muffin with Ham & Egg","r","Ham","Fried Egg","English Muffin"]
	@list3 = ["Muffin with Sausage","r","English Muffin","Sausage","Sausage"]
	@recipe1 = Recipe.new( @list1, @db )
	@recipe2 = Recipe.new( @list2, @db )
	@recipe3 = Recipe.new( @list3, @db )
  end
  
  def test_for_add_to_db
    assert( @db.database.has_key?( list1[0] ), 
	  "Recipe1 is not in db." )
	assert( @db.database.has_key?( list2[0] ), 
	  "Recipe2 is not in db." )
	assert( @db.database.has_key?( list3[0] ), 
	  "Recipe3 is not in db." )
  end
  
  def test_for_ingredients
    @list1.slice( 0, 2 )
    @list1.each do |ingredient|
	  assert( @recipe1.ingredients.include?( @db[ ingredient ] ), 
	    "Recipe1 does not contain #{ingredient}." )
	end
	
	@list2.slice( 0, 2 )
    @list2.each do |ingredient|
	  assert( @recipe2.ingredients.include?( @db[ ingredient ] ), 
	    "Recipe2 does not contain #{ingredient}." )
	end
	
	@list3.slice( 0, 2 )
    @list3.each do |ingredient|
	  assert( @recipe3.ingredients.include?( @db[ ingredient ] ), 
	    "Recipe3 does not contain #{ingredient}." )
	end
  end
  
  def test_for_calories
    assert_equal( @recipe1.calories, 320 )
	assert_equal( @recipe2.calories, 180 )
	assert_equal( @recipe3.calories, 240 )
  end

end # end class