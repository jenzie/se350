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
    assert_equal( @db.size, 24 )
  end
  
  def test_for_createItem
    assert( @db.createItem( @list1 ).kind_of?( Recipe ), 
	  "List1 does not produce a recipe." )
	assert( @db.createItem( @list2 ).kind_of?( BasicFood ), 
	  "List2 does not produce a basic food." )
  end
end # end class