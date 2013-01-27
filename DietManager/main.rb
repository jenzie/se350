##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: main.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require 'date'
require 'io/console'
require './FoodDB'
require './Log'

def run
  # ARGV = ["FoodDB.txt", "DietLog.txt"]
  db = FoodDB.new( ARGV[0] )
  log = Log.new( ARGV[1], db )
  
  puts "Welcome to the Diet Manager!"
  printOptions
  
  # use STDIN.gets because .gets defaults input from file (ARGV)
  while command = STDIN.gets.chomp!
    case command
	when "0"
      printAll( db )
	when "1"
	  printName( db )
	when "2"
	  findPrefix( db )
    when "3"
	  newFood( db )
	when "4"
	  newRecipe( db )
	when "5"
	  showLog( log )
	when "6"
	  showToday( log )
	when "7"
	  showDate( log )
	when "8"
	  logToday( db, log )
	when "9"
	  logDate( db, log )
	when "10"
	  logRemove( log )
	when "11"
	  save( db, log, ARGV[0], ARGV[1] )
	when "12"
      quit( db, log, ARGV[0], ARGV[1] )
    else
      puts "Invalid Command."
	end
	printOptions
  end
end

def printOptions
  puts "\nSelect one of the following options.\n"
  puts "
  [0] Print All
  [1] Print Name
  [2] Find Prefix
  [3] New Food
  [4] New Recipe
  [5] Show Log
  [6] Show Today
  [7] Show Date
  [8] Log Today
  [9] Log Date
  [10] Log Delete
  [11] Save
  [12] Quit\n"
end

def printAll( foodDB )
  puts "\nThere are currently #{foodDB.size} entries in the database.\n\n"
  foodDB.printAll
end

def printName( foodDB )
  puts "Enter the name of the food entry."
  name = STDIN.gets.chomp!.strip
  # makes sure that only the first letter is changed to uppercase
  name = name.slice(0,1).capitalize + name.slice(1..-1)
  foodDB.printName( name )
end

def findPrefix( foodDB )
  puts "Enter the prefix of the food entry."
  prefix = STDIN.gets.chomp!.strip
  foodDB.findAll( prefix )
end

def newFood( foodDB )
  puts "Enter the name of the basic food entry."
  name = STDIN.gets.chomp!.strip
  puts "Enter the number of calories."
  calories = STDIN.gets.chomp!.strip
  foodDB.addFood( name, calories )
end

def newRecipe( foodDB )
  puts "Enter the name of the recipe entry."
  name = STDIN.gets.chomp!.strip
  
  puts "Enter the name of the ingredients (\"Okay\" to finish)"
  ingredients = Array.new
  item = STDIN.gets.chomp!.strip
  while item.casecmp( "Okay" ) != 0
    ingredients << item
	item = STDIN.gets.chomp!.strip
  end
  foodDB.addRecipe( name, ingredients )
end

def showLog( foodLog )
  puts foodLog.showAll
end

def showToday( foodLog )
  today = Date.today.to_s
  puts foodLog.showDate( today ) 
end

def showDate( foodLog )
  puts "Enter the date to show entries for."
  date = STDIN.gets.chomp!.strip
  puts foodLog.showDate( date )
end

def logToday( foodDB, foodLog )
  puts "Enter a single food entry into the log for today."
  item = STDIN.gets.chomp!.strip
  foodLog.logForToday( item )
end

def logDate( foodDB, foodLog )
  puts "Enter the date for the food entry to add to log."
  date = STDIN.gets.chomp!.strip
  puts "Enter a single food entry into the log for #{date}."
  item = STDIN.gets.chomp!.strip
  foodLog.logForDate( item, date )
end

def logRemove( foodLog )
  puts "Enter the date for the food entry to be removed from the log."
  date = STDIN.gets.chomp!.strip
  puts "Enter a single food entry to be removed for #{date}."
  item = STDIN.gets.chomp!.strip
  puts foodLog.remove( item, date )
end

def save( foodDB, foodLog, db_file, log_file )
  puts "Saving food database and log...\n\n"
  
  if !foodDB.hasChanges
    puts "No changes have been made to the database."
  else
    # get changes for database and save to file
    changesDB = foodDB.getChanges
    db_handle = File.open( db_file, 'a' )
    changesDB.each do |line|
      db_handle.write( line + "\n" )
    end
    db_handle.close
	puts "Success! Database has been saved!\n"
  end
  
  if !foodLog.hasChanges
    puts "No changes have been made to the log."
  else
    # get all information for log and save to file
    getLog = foodLog.getLog
    log_handle = File.open( log_file, 'w' )
	log_handle.write( getLog )
    log_handle.close
	foodLog.hasChanges = false
	puts "Success! Log has been saved!\n"
  end
end

def quit( foodDB, foodLog, db_file, log_file )
  if ( foodDB.hasChanges || foodLog.hasChanges )
    save( foodDB, foodLog, db_file, log_file )
  end
  puts "\nGood bye!"
  exit
end

run