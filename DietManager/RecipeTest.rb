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

class RecipeTest < Test::Unit::TestCase

  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@list1 = ["Egg & Sausage","r","Fried Egg","Fried Egg","Sausage","Sausage"]
	@list2 = ["Muffin with Ham & Egg","r","Ham","Fried Egg","English Muffin"]
	@list3 = ["Muffin with Sausage","r","English Muffin","Sausage","Sausage"]
	@recipe1 = Recipe.new( @list1, @db.database )
	@recipe2 = Recipe.new( @list2, @db.database )
	@recipe3 = Recipe.new( @list3, @db.database )
  end
  
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
  
  def test_for_calories
    assert_equal( @recipe1.calories, 320 )
	assert_equal( @recipe2.calories, 180 )
	assert_equal( @recipe3.calories, 240 )
  end

end # end class