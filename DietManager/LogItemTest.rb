##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: LogItemTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './LogItem'
require 'test/unit'

class LogItemTest < Test::Unit::TestCase

  def setup
    @item1 = LogItem.new( "2013-02-01", "Ham" )
    @item2 = LogItem.new( "2013-02-02", "Candy" )
  end
  
  def test_for_modifyEntry
    assert( @item1.entry.include?( "Ham" ), 
	  "Entry does not include 'Ham'." )
    assert_equal( @item1.entry.length, 1 )
    assert_equal( @item2.entry.length, 1 )
	
	@item1.modifyEntry( "Sausage" )
	@item1.modifyEntry( "Sausage" )
	@item1.modifyEntry( "Fried Egg" )
	assert_equal( @item1.entry.length, 3 )
	assert( @item1.entry.include?( "Sausage" ), 
	  "Entry does not include 'Sausage'." )
	assert( @item1.entry.include?( "Fried Egg" ), 
	  "Entry does not include 'Fried Egg'." )
	assert_equal( @item1.count[ @item1.entry.index( "Sausage" ) ], 2 )
  end

end # end class