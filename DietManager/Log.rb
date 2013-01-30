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

##
# Log
# Stores information for food entries consumed based on the date.
##
class Log

  ##
  # Constructor for Log.
  # initialize: String * FoodDB -> void
  # file:       string representing the name of the log file
  # foodDB:     food database containing all food entries
  ##
  def initialize( file, foodDB )
    @db = foodDB
    @log = Hash.new
	@hasChanges = false
	
	# check if file is readable before parsing
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
  
  ##
  # Getter for Log.hasChanges
  ##
  attr_accessor :hasChanges
  
  ##
  # Creates an entry in the log based on the date and food entry.
  # entry: array containing the date and food entry in the format:
  #        ["YYYY-MM-DD", "Food_Name"]
  ##
  def createEntry( entry )
    entry[1] = entry[1].chomp.strip
	entry[1] = entry[1].slice(0,1).capitalize + entry[1].slice(1..-1)
    
	# check if the food entry exists in food database
	if !@db.contains( entry[1] )
	  return "Error: Could not log entry; '#{entry[1]}' does not exist in database."
	end
	
	# check if date exists in log; modify if it exists
    if @log.has_key?( entry[0] )
	  @log[ entry[0] ].modifyEntry( entry[1] )
	# create a new entry if it does not exist
	else
	  @log[ entry[0] ] = LogItem.new( entry[0], entry[1] )
	end
	return "Success! Item '#{entry[1]}' was added to log for '#{entry[0]}'."
  end
  
  ##
  # Add an entry into the log for today.
  # item: name of the BasicFood or Recipe entry
  ##
  def logForToday( item )
    # flag that there are changes to the food log
    @hasChanges = true
    return createEntry( [ Date.today.to_s, item ] )
  end
  
  ##
  # Add an entry into the log for a given date.
  # item: name of the BasicFood or Recipe entry
  # day:  date that the food was consumed
  ##
  def logForDate( item, day )
    @hasChanges = true
	
	# check that the date is in a valid format
    date = day.split( "-" )
    if !Date.valid_date? date[0].to_i, date[1].to_i, date[2].to_i
	  return "Error: Invalid date; format YYYY-MM-DD."
	end
	
	# create the entry into the log
    return createEntry( [ day, item ] )
  end
  
  ##
  # Remove a single unit of the food for the given day in the log.
  # item: name of the BasicFood or Recipe entry to be removed
  # day:  date to remove the food entry for
  ##
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
	@hasChanges = true
	string = @log[ day ].deleteEntry( item )
	
	# delete the hash if log contains no food entries for the date anymore
	if @log[ day ].isEmpty
	  @log.delete( day )
	end
	return string
  end
  
  ##
  # Return a string containing all entries in the log.
  ##
  def showAll
    string = ""
	
	# store sorted log into array in ascending order of the date
	logArr = @log.sort_by{ |x, y| [ x.to_s, y.to_s ] }
	logArr.each do |key, entry|
	  string += entry.printEntry
	end
	return string
  end
  
  ##
  # Return a string containing all entries for the given date on the log.
  # date: date of entries to search for
  ##
  def showDate( date )
    # check if the date is in a valid format
    dateArr = date.split( "-" )
    if !Date.valid_date? dateArr[0].to_i, dateArr[1].to_i, dateArr[2].to_i
	  return "Error: Invalid date; format YYYY-MM-DD."
	end
	
    string = "\n"
	# store sorted log into array in ascending order of the date
	logArr = @log.sort_by{ |x, y| [ x.to_s, y.to_s ] }
	logArr.each do |key, entry|
	  if ( key <=> date ) == 0
	    string += entry.printEntry
	  end
	end
	
	# message if there are no entries for the given date
	if ( string <=> "\n" ) == 0
	  string.concat( "There are no log entries for '#{date}'." )
	end
	
	# return final results
	return string
  end
  
  ##
  # Return a string containing all log information in the valid 
  # input file format (for saving the log).
  ##
  def getLog
    string = ""
	logArr = @log.sort_by{ |x, y| [ x.to_s, y.to_s ] }
	logArr.each do |key, entry|
	  entries = entry.getEntries
	  entries.each do |item|
	    string += key + "," + item + "\n"
	  end
	end
	return string
  end

end # end class