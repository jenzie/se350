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

##
# Unit tests for Log.rb.
##
class LogTest < Test::Unit::TestCase

  ##
  # Creates instances of FoodDB, Log, and lists of entry information
  # for succeeding unit tests.
  ##
  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@log = Log.new( "DietLog.txt", @db )
	@entry1 = [ "2013-02-01", "item_does_not_exist" ]
	@entry2 = [ "2013-02-02", "Bread Slice" ]
	@entry3 = [ "2013-02-02", "Jelly" ]
  end
  
  ##
  # Validates that log entries are created given the date and item.
  ##
  def test_for_createEntry
    assert_equal( @log.createEntry( @entry1 ),
	  "Error: Could not log entry; '#{@entry1[1]}' does not exist in database." )
	assert_equal( @log.createEntry( @entry2 ),
	  "Success! Item '#{@entry2[1]}' was added to log for '#{@entry2[0]}'." )
	assert_equal( @log.createEntry( @entry3 ),
	  "Success! Item '#{@entry3[1]}' was added to log for '#{@entry3[0]}'." )
  end
  
  ##
  # Validates that a log entry can be added for today.
  ##
  def test_for_logForToday
    assert_equal( @log.logForToday( "Candy" ),
	  "Success! Item 'Candy' was added to log for '2013-01-27'." )
	assert_equal( @log.logForToday( "something" ),
	  "Error: Could not log entry; 'Something' does not exist in database." )
  end
  
  ##
  # Validates that a log entry can be added for a given date.
  ##
  def test_for_logForDate
    assert_equal( @log.logForDate( "Gum", "12345678" ),
	  "Error: Invalid date; format YYYY-MM-DD." )
	assert_equal( @log.logForDate( "idk", "2013-02-01" ),
	  "Error: Could not log entry; 'Idk' does not exist in database." )
	assert_equal( @log.logForDate( "Fried Egg", "2013-02-01" ),
	  "Success! Item 'Fried Egg' was added to log for '2013-02-01'." )
  end
  
  ##
  # Validates that a log entry can be removed for the given date and item.
  ##
  def test_for_remove
    assert_equal( @log.remove( "doesn't_matter", "invalid_date" ),
	  "Error: Invalid date; format YYYY-MM-DD." )
	assert_equal( @log.remove( "doesn't_matter", "1990-01-01" ),
	  "Error: No entries were logged for '1990-01-01'." )
	assert_equal( @log.remove( "doesn't_exist", "2013-01-15" ),
	  "Error: 'Doesn't_exist' is not logged for '2013-1-15'." )
	assert_equal( @log.remove( "Gum", "2013-01-15" ),
	  "Success! 'Gum' was deleted for '2013-1-15'." )
  end
  
  ##
  # Validates that all log entries are returned as a string correctly.
  ##
  def test_for_showAll
    assert_equal( @log.showAll,
      "2013-1-15\n  PB&J Sandwich\n  Gum\n  Grilled Cheese\n  Steak\n\n2013-1-16\n  Ice Cream\n  Orange\n  Candy\n  Blueberry Muffin\n  Bagel with Cream Cheese\n  Steak\n\n2013-1-17\n  Muffin with Egg & Sausage\n  Gum (2)\n  Plain Bagel\n  Fried Egg\n  Steak\n  Corn Muffin\n\n2013-1-26\n  Wine (2)\n  Beer (6)\n\n2013-1-27\n  Gin & Tonic (2)\n  Tequila & Lime (3)\n  White Russian (2)\n\n" )
  end
  
  ##
  # Validates that a string containing all log entries for a given date 
  # is returned correctly.
  ##
  def test_for_showDate
    assert_equal( @log.showDate( "invalid_date" ), 
	  "Error: Invalid date; format YYYY-MM-DD." )
	assert_equal( @log.showDate( "2012-01-01" ),
	  "\nThere are no log entries for '2012-01-01'." )
	assert_equal( @log.showDate( "2013-01-17" ),
      "\n2013-1-17\n  Muffin with Egg & Sausage\n  Gum (2)\n  Plain Bagel\n  Fried Egg\n  Steak\n  Corn Muffin\n\n" )
  end
  
  ##
  # Validates that all the information on the log is returned correctly 
  # in the valid format for a file (used for saving the log.)
  ##
  def test_for_getLog
    assert_equal( @log.getLog,
      "2013-01-15,PB&J Sandwich\n2013-01-15,Gum\n2013-01-15,Grilled Cheese\n2013-01-15,Steak\n2013-01-16,Ice Cream\n2013-01-16,Orange\n2013-01-16,Candy\n2013-01-16,Blueberry Muffin\n2013-01-16,Bagel with Cream Cheese\n2013-01-16,Steak\n2013-01-17,Muffin with Egg & Sausage\n2013-01-17,Gum\n2013-01-17,Gum\n2013-01-17,Plain Bagel\n2013-01-17,Fried Egg\n2013-01-17,Steak\n2013-01-17,Corn Muffin\n2013-01-26,Wine\n2013-01-26,Wine\n2013-01-26,Beer\n2013-01-26,Beer\n2013-01-26,Beer\n2013-01-26,Beer\n2013-01-26,Beer\n2013-01-26,Beer\n2013-01-27,Gin & Tonic\n2013-01-27,Gin & Tonic\n2013-01-27,Tequila & Lime\n2013-01-27,Tequila & Lime\n2013-01-27,Tequila & Lime\n2013-01-27,White Russian\n2013-01-27,White Russian\n" )
  end

end #end class