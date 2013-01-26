##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: FoodDBTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './FoodDB'
require 'test/unit'

class FoodDBTest < Test::Unit::TestCase

  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@list1 = ["Egg & Sausage","r","Fried Egg","Fried Egg","Sausage","Sausage"]
	@list2 = ["Doritos","b",999]
  end
  
  def test_for_size
    assert_equal( @db.size, 25 )
  end
  
  def test_for_createItem
    assert( @db.createItem( @list1 ).kind_of?( Recipe ), 
	  "List1 does not produce a recipe." )
	assert( @db.createItem( @list2 ).kind_of?( BasicFood ), 
	  "List2 does not produce a basic food." )
  end
  
  def test_for_contains
    assert( @db.contains( "Gum" ),
	  "Database does not contain 'Gum'." )
	assert( !@db.contains( "Paper" ),
	  "Database contains 'Paper'." )
	assert( @db.contains( "PB&J Sandwich" ),
	  "Database does not contain 'PB&J Sandwich'." )
	assert( @db.contains( "bread Slice" ),
	  "Database does not contain 'bread Slice'." )
  end
  
  def test_for_addFood
    @db.addFood( "Marshmallow", 10 )
	assert( @db.contains( "Marshmallow" ),
	  "Database does not contain 'Marshmallow'." )
	assert_equal( @db.size, 26 )
	@db.addFood( "Gum", 1000 )
	assert( @db.contains( "Gum" ),
	  "Database does not contain 'Gum'." )
	assert( @db.size == 26, "'Gum' was added to database twice." )
	@db.addFood( "Skittle", -5 )
	assert( @db.contains( "Skittle" ),
	  "Database does not contain 'Skittle'." )
	assert_equal( @db.size, 27 )
  end
  
  def test_for_addRecipe
    list1 = ["Plain Bagel", "Jelly", "Jelly"]
    @db.addRecipe( "Jelly Bagel", list1 )
	assert( @db.contains( "Jelly Bagel" ),
	  "Database does not contain 'Jelly Bagel'." )
	assert_equal( @db.size, 26 )
	
	list2 = ["Candy", "Candy", "Gum", "Gum", "M&M"]
	@db.addRecipe( "Sugar Delight", list2 )
	assert( !@db.contains( "Sugar Delight" ),
	  "Database added 'Sugar Delight' but 'M&M' is an invalid ingredient." )
	assert_equal( @db.size, 26 )
	
	list3 = ["Cheese Slice"]
	@db.addRecipe( "Cheeeeeeeeeese", list3 )
	assert( @db.contains( "Cheeeeeeeeeese" ),
	  "Database does not contain 'Cheeeeeeeeeese'." )
	assert_equal( @db.size, 27 )
  end
  
  def test_for_changes	
    list1 = ["Plain Bagel", "Jelly", "Jelly"]
    @db.addRecipe( "Jelly Bagel", list1 ) # success
	assert_equal( @db.getChanges.length, 1 )
	
	list2 = ["Candy", "Candy", "Gum", "Gum", "M&M"]
	@db.addRecipe( "Sugar Delight", list2 ) # fail
	assert_equal( @db.getChanges.length, 0 )
  end
  
end # end class