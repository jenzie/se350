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
  
  def test_for_deleteEntry
    assert_equal( @item1.deleteEntry( "doesn't exist" ),
	  "Error: 'Doesn't exist' is not logged for '2013-2-1'." )
	assert_equal( @item1.deleteEntry( "ham" ),
	  "Success! 'Ham' was deleted for '2013-2-1'." )
  end
  
  def test_for_printEntry
    assert_equal( @item1.printEntry, "2013-2-1\n  Ham\n\n" )
	assert_equal( @item2.printEntry, "2013-2-2\n  Candy\n\n" )
  end
  
  def test_for_getEntries
    assert_equal( @item1.getEntries[0], "Ham" )
    assert_equal( @item2.getEntries[0], "Candy" )
	
  end

end # end class