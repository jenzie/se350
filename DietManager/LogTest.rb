##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: LogTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './Log'
require 'test/unit'

class LogTest < Test::Unit::TestCase

  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@log = Log.new( "DietLog.txt", @db )
	@entry1 = [ "2013-02-01", "item_does_not_exist" ]
	@entry2 = [ "2013-02-02", "Bread Slice" ]
	@entry3 = [ "2013-02-02", "Jelly" ]
  end
  
  def test_for_createEntry
    assert( !@log.createEntry( @entry1 ),
	  "Entry was created, but '#{@entry1[1]}' does not exist in database." )
	assert( @log.createEntry( @entry2 ),
	  "Entry2 was not created and added into the log." )
	assert( @log.createEntry( @entry3 ),
	  "Entry3 was not modified into the log." )
  end
  
  def test_for_logForToday
    assert( @log.logForToday( "Candy" ),
	  "Entry 'Candy' was not added for today." )
	assert( !@log.logForToday( "something" ),
	  "Entry 'something' was added to log, but it does not exist." )
  end
  
  def test_for_logForDate
    assert( !@log.logForDate( "Gum", "12345678" ),
	  "Entry1 was added to log, but date is invalid." )
	assert( !@log.logForDate( "idk", "2013-02-01" ),
	  "Entry2 was added to log, but item does not exist in database." )
	assert( @log.logForDate( "Fried Egg", "2013-02-01" ),
	  "Entry3 was not added to database." )
  end
  
  def test_for_showAll
    assert_equal( @log.showAll,
	"2013-1-15\n  PB&J Sandwich\n  Gum\n  Grilled Cheese\n  Steak\n\n2013-1-16\n  Ice Cream\n  Orange\n  Candy\n  Blueberry Muffin\n  Bagel with Cream Cheese\n  Steak\n\n2013-1-17\n  Muffin with Egg & Sausage\n  Gum (2)\n  Plain Bagel\n  Fried Egg\n  Steak\n  Corn Muffin\n\n" )
  end

end #end class