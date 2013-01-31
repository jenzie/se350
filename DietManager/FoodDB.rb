##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: FoodDB.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './Recipe.rb'
require './BasicFood.rb'

##
# FoodDB
# Stores all BasicFood and Recipe entries in a hashtable.
##
class FoodDB

  ##
  # Constructor for FoodDB.
  # initialize: string -> void
  # file:       string representing the name of the food database file.
  ##
  def initialize( file )
	@database = Hash.new # stores entire db
	@newItems = Hash.new # stores newly added items
	
	# check if file is readable before parsing
	if File.readable?( file )
	  File.open( file , "r" ).each do |line|
		item = line.split(",")
		@database[ item[0] ] = createItem( item )
	  end
	else
	  # ARGV = ["FoodDB.txt", "DietLog.txt"]
	  puts "Usage: ruby main.rb database.txt log.txt"
	end
  end
  
  ##
  # Getter for FoodDB.database
  ##
  attr_accessor :database
  
  ##
  # Return the total number of BasicFood and Recipe entries stored.
  ##
  def size
    @database.length
  end
  
  ##
  # Factory to create and add a food entry to the database.
  ##
  def createItem( item )
	if item[1].eql?("b")
	  return BasicFood.new( item[0], item[2] )
	elsif item[1].eql?("r")
	  return Recipe.new( item, @database )
	end
  end
  
  ##
  # Print all of the food entries stored in the database.
  ##
  def printAll
    string = ""
    @database.each do |key, value|
	  if value != nil
	    if value.kind_of?( BasicFood )
	      string += value.printItem(1)
	    else
	      string += value.printItem(0)
		end
	  end
	end
	return string
  end
  
  ##
  # Print a single BasicFood or Recipe entry by name.
  # name: name of the food entry
  ##
  def printName( name )
    name = capitalize( name )
	
	# check if the food entry exists in the database
    if !@database.include?( name )
	  return "Error: '#{name}' does not exist in database."
	end
	
	# check for food entry type; call the appropriate print function
	item = @database[ name ]
	if item.kind_of?( BasicFood )
	  return item.printItem(1)
    else
	  return item.printItem(0)
	end
  end
  
  ##
  # Find all of the food entries that begin with the prefix.
  # prefix: prefix of entry names (case insensitive)
  ##
  def findAll( prefix )
    string = ""
    count = 0
	
	# compare entry names as all lowercase to avoid case check
    prefix = prefix.downcase
    @database.each do |key, value|
	  temp = key.downcase
	  if temp.start_with?( prefix )
	    count += 1
	    if value.kind_of?( BasicFood )
	      string += value.printItem(1)
	    else
	      string += value.printItem(0)
		end
	  end
	end
	
	# message if no entries were found
	if count == 0
	  string = "No entries found with the prefix '#{prefix}'."
	end
	
	# return final result
	return string
  end
  
  ##
  # Check if a food entry exists.
  # name: name of the BasicFood or Recipe entry.
  ##
  def contains( name )
    name = name.downcase
    @database.each do |key, value|
	  if ( name <=> key.downcase ) == 0
	    return true
	  end
	end
	return false
  end
  
  ##
  # Add a BasicFood entry based on user input from main.rb.
  # name:     name of the BasicFood entry
  # calories: number of calories for the BasicFood entry
  ##
  def addFood( name, calories )
    # check if the entry already exists
	if contains( name )
      return "Error: Food entry '#{name}' already exists in database."
    end
	
	# create the food entry
    @database[ name ] = BasicFood.new( name, calories )
	@newItems[ name ] = BasicFood.new( name, calories )
	return "Success! Food entry '#{name}' was added."
  end
  
  ##
  # Add a Recipe entry based on user input from main.rb.
  # name:        name of the Recipe entry
  # ingredients: array of strings representing ingredients
  ##
  def addRecipe( name, ingredients )
    # check if the entry already exists
	if contains( name )
      return "Error: Food entry '#{name}' already exists in database."
    end
	
	# check if all the ingredients exist
	ingredients.each do |item|
	  if !contains( item )
	    return "Error: Ingredient '#{item}' does not exist in database."
	  end
	end
	
	# create the food entry
	name = capitalize( name )
	info = [name, "r"]
	info.concat( ingredients )
	info_cpy = info.inject([]) { | a, element | a << element.dup }
	@database[ name ] = Recipe.new( info, @database )
	@newItems[ name ] = Recipe.new( info_cpy, @database )
	return "Success! Recipe entry '#{name}' was added."
  end
  
  ##
  # Check if the FoodDB has changed.
  ##
  def hasChanges
    return @newItems.length > 0
  end
  
  ##
  # Return the string representation of the changes made to the database.
  # Removes the changes from the "queue" of changes made.
  ##
  def getChanges
    changes = Array.new
	@newItems.each do |name, object|
	  if object.kind_of?( BasicFood )
	    changes << "#{object.name},b,#{object.calories.to_s}"
	  elsif object.kind_of?( Recipe )
	    index = 0
	    entry = "#{name},r"
		object.ingredients.each do |ingred_obj|
		  multiple = object.count[ index ]
		  multiple.times do 
		    entry.concat( ",")
		    entry.concat( ingred_obj.name )
		  end
		  index += 1
		end
		changes << entry
	  end
	end
	@newItems = Array.new
	return changes
  end
  
  ##
  # Capitalize the first letter of the string.
  # string: string of characters to capitalize
  ##
  def capitalize( string )
    return string.slice(0,1).capitalize + string.slice(1..-1)
  end
  
end # end class