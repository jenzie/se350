##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: BasicFoodTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './BasicFood'
require 'test/unit'

##
# Unit tests for BasicFood.rb
##
class BasicFoodTest < Test::Unit::TestCase

  ##
  # Creates instances of BasicFood for succeeding unit tests.
  ##
  def setup
    @entry1 = BasicFood.new( "Apple", 50 )
	@entry2 = BasicFood.new( "Banana", 70 )
	@entry3 = BasicFood.new( "Cherry", 15 )
  end
  
  ##
  # Validate that the name is stored correctly.
  ##
  def test_for_name
    assert_equal( @entry1.name, "Apple" )
	assert_equal( @entry2.name, "Banana" )
	assert_equal( @entry3.name, "Cherry" )
  end
  
  ##
  # Validate that the number of calories is stored correctly.
  ##
  def test_for_calories
    assert_equal( @entry1.calories, 50 )
	assert_equal( @entry2.calories, 70 )
	assert_equal( @entry3.calories, 15 )
  end
  
  ##
  # Validate that the information for the entry is printed correctly.
  ##
  def test_for_printItem
    assert_equal( @entry1.printItem( 1 ), "Apple 50\n" )
	assert_equal( @entry2.printItem( 2 ), "Banana (2) 140\n" )
	assert_equal( @entry3.printItem( 3 ), "Cherry (3) 45\n" )
  end
  
end # end class