##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: Log.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require 'date'
require './FoodDB'
require './LogItem'

class Log

  def initialize( file, foodDB )
    @db = foodDB
    @log = Hash.new
	@newEntries = Hash.new
	
	if File.readable?( file )
	  File.open( file , "r" ).each do |line|
		entry = line.split(",")
		createEntry( entry )
	  end
	else
	  # ARGV = ["FoodDB.txt", "DietLog.txt"]
	  puts "Usage: ruby main.rb database.txt log.txt"
	end
  end
  
  def createEntry( entry )
    entry[1] = entry[1].chomp.strip
    if !@db.contains( entry[1] )
	  puts "Error: Could not log entry; '#{entry[1]}' does not exist in database."
	  return false
	end
    if @log.has_key?( entry[0] )
	  @log[ entry[0] ].modifyEntry( entry[1] )
	else
	  @log[ entry[0] ] = LogItem.new( entry[0], entry[1] )
	end
	return true
  end
  
  def logForToday( item )
    createEntry( [ Date.today.to_s, item ] )
  end
  
  def logForDate( item, day )
    date = day.split( "-" )
    if !Date.valid_date? date[0].to_i, date[1].to_i, date[2].to_i
	  puts "Error: Invalid date; format YYYY-MM-DD."
	  return false
	end
    return createEntry( [ day, item ] )
  end
  
  def remove( item, day )
    item = item.chomp.strip
    day = day.chomp.strip
	
	# check if given date is valid
    date = day.split( "-" )
	if !Date.valid_date? date[0].to_i, date[1].to_i, date[2].to_i
	  return "Error: Invalid date; format YYYY-MM-DD."
	end
	
	# check if given date exists on log
	if !@log.include?( day )
	  return "Error: No entries were logged for '#{day}'."
	end
	
	# finally try to remove
	return @log[ day ].deleteEntry( item )
  end
  
  def showAll
    string = ""
	@logArr = @log.sort_by{ |x, y| [ x.to_s, y.to_s ] }
	@logArr.each do |key, entry|
	  string += entry.printEntry
	end
	return string
  end
  
  def showDate( date )
    dateArr = date.split( "-" )
    if !Date.valid_date? dateArr[0].to_i, dateArr[1].to_i, dateArr[2].to_i
	  return "Error: Invalid date; format YYYY-MM-DD."
	end
	
    string = "\n"
	@logArr = @log.sort_by{ |x, y| [ x.to_s, y.to_s ] }
	@logArr.each do |key, entry|
	  if ( key <=> date ) == 0
	    string += entry.printEntry
	  end
	end
	if ( string <=> "\n" ) == 0
	  string.concat( "There are no log entries for '#{date}'." )
	end
	return string
  end

end # end class