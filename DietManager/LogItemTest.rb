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

##
# Unit tests for LogItem.rb.
##
class LogItemTest < Test::Unit::TestCase

  ##
  # Creates instances of LogItem to use for succeeding unit tests.
  ##
  def setup
    @item1 = LogItem.new( "2013-02-01", "Ham" )
    @item2 = LogItem.new( "2013-02-02", "Candy" )
  end
  
  ##
  # Validates that modifying (adding) to the list of items works correctly.
  ##
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
  
  ##
  # Validates that a single item unit can be removed from the list of items.
  ##
  def test_for_deleteEntry
    assert_equal( @item1.deleteEntry( "doesn't exist" ),
	  "Error: 'Doesn't exist' is not logged for '2013-02-01'." )
	assert_equal( @item1.deleteEntry( "ham" ),
	  "Success! 'Ham' was deleted for '2013-02-01'." )
  end
  
  ##
  # Validates that the log entry items are printed correctly.
  ##
  def test_for_printEntry
    assert_equal( @item1.printEntry, "2013-02-01\n  Ham\n\n" )
	assert_equal( @item2.printEntry, "2013-02-02\n  Candy\n\n" )
  end
  
  ##
  # Validates that the array of food items are returned correctly. Item 
  # entries that occur multiple times occur multiple times in the array.
  ##
  def test_for_getEntries
    assert_equal( @item1.getEntries[0], "Ham" )
    assert_equal( @item2.getEntries[0], "Candy" )
  end
  
  ##
  # Validates that the LogItem is empty when there are no food items stored.
  ##
  def test_for_isEmpty
    assert( !@item1.isEmpty, "Item1 is empty when it contains one entry." )
	@item1.deleteEntry( "Ham" )
	assert( @item1.isEmpty, "Item1 is not empty when it is." )
  end
  
  def test_for_date_toStr
	assert_equal( @item1.date_toStr, "2013-02-01" )
	assert_equal( @item2.date_toStr, "2013-02-02" )
  end

end # end class