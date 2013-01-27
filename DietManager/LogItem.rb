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

class LogItem

  def initialize( day, item )
    item = item.slice(0,1).capitalize + item.slice(1..-1)
    @date = Date._strptime( day, "%Y-%m-%d" )
	@entry = [ item ]
	@count = [ 1 ]
  end
  
  ##
  # Getters are for testing purposes only
  ##
  attr_accessor :entry, :count
  
  def modifyEntry( item )
    if @entry.include?( item )
	  @count[ @entry.index( item ) ] += 1
	else
	  @entry << item
	  @count << 1
	end
  end
  
  def deleteEntry( item )
    item = item.slice(0,1).capitalize + item.slice(1..-1)
    dayArr = Array.new
    @date.each do |day, value|
	  dayArr << value.to_s
	end
	day = dayArr.join( "-" )
	
    if @entry.include?( item )
	  index = entry.index( item )
	  if @count[ index ] > 1
	    @count[ index ] -= 1
	  else
	    @count.delete_at( index )
		@entry.delete_at( index )
	  end
	  return "Success! '#{item}' was deleted for '#{day}'."
	end
	return "Error: '#{item}' is not logged for '#{day}'."
  end
  
  def printEntry
    index = 0
	dayArr = Array.new
    @date.each do |day, value|
	  dayArr << value.to_s
	end
	string = dayArr.join( "-" ).concat( "\n" )
	
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
  
  def isEmpty
    return @entry.length == 0
  end

end # end class