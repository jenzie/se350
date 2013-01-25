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

class BasicFoodTest < Test::Unit::TestCase

  def setup
    @entry1 = BasicFood.new( "Apple", 50 )
	@entry2 = BasicFood.new( "Banana", 70 )
	@entry3 = BasicFood.new( "Cherry", 15 )
  end
  
  def test_for_name
    assert_equal( @entry1.name, "Apple" )
	assert_equal( @entry2.name, "Banana" )
	assert_equal( @entry3.name, "Cherry" )
  end
  
  def test_for_calories
    assert_equal( @entry1.calories, 50 )
	assert_equal( @entry2.calories, 70 )
	assert_equal( @entry3.calories, 15 )
  end
  
end # end class