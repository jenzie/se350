##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: LogItem.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require 'date'
require './Log'

##
# LogItem
# Stores the list of foods consumed for a date on the Log.
##
class LogItem

  ##
  # Constructor for LogItem.
  # initialize: String * String -> void
  # day:        string representing the date, in YYYY-MM-DD format
  # item:       string representing the food entry
  ##
  def initialize( day, item )
    item = item.slice(0,1).capitalize + item.slice(1..-1)
    @date = Date._strptime( day, "%Y-%m-%d" )
	@entry = [ item ] # list of food entries
	@count = [ 1 ] # count for each food entry
  end
  
  ##
  # Getter for LogItem.entry, LogItem.count
  ##
  attr_accessor :entry, :count
  
  ##
  # Add a food entry for the associated LogItem (by date).
  # item: name of the BasicFood or Recipe entry to add.
  ##
  def modifyEntry( item )
    # if the food entry is already on the log entry, increment the count
    if @entry.include?( item )
	  @count[ @entry.index( item ) ] += 1
	# otherwise, add the food entry and set count as "1"
	else
	  @entry << item
	  @count << 1
	end
  end
  
  ##
  # Remove a single unit of the item from the log entry.
  # item: name of the BasicFood or Recipe entry to remove
  ##
  def deleteEntry( item )
    item = item.slice(0,1).capitalize + item.slice(1..-1)
	
	# convert the date to a string
    day = date_toStr
	
	# check if the item exists on log entry
    if @entry.include?( item )
	  index = entry.index( item )
	  # decrement if count is more than one
	  if @count[ index ] > 1
	    @count[ index ] -= 1
	  # delete if count is one
	  else
	    @count.delete_at( index )
		@entry.delete_at( index )
	  end
	  return "Success! '#{item}' was deleted for '#{day}'."
	end
	return "Error: '#{item}' is not logged for '#{day}'."
  end
  
  ##
  # Return a string containing all information for the log entry.
  ##
  def printEntry
    index = 0
	string = date_toStr + "\n"
	
	@entry.each do |item|
	  if @count[ index ] == 1
	    string.concat( "  " + item + "\n" )
	  else
	    string.concat( "  " + item + " (" + @count[ index ].to_s + ")\n" )
	  end
	  index += 1
	end
	string.concat( "\n" )
	return string
  end
  
  ##
  # Return a string containing all of the food items in the log entry.
  ##
  def getEntries
    index = 0
    entries = Array.new
    @entry.each do |item|
	  @count[ index ].times do
	    entries << item
	  end
	  index += 1
	end
	return entries
  end
  
  ##
  # Check if there are no food items in the log entry.
  ##
  def isEmpty
    return @entry.length == 0
  end
  
  ##
  # Take an integer date and convert to string with padded zeros.
  ##
  def date_toStr
    dayArr = Array.new
    @date.each do |day, value|
	  value = value.to_s
	  if value.length == 1
	    value = "0" + value # pad extra zero
	  end
	  dayArr << value
	end
	return dayArr.join( "-" )
  end

end # end class