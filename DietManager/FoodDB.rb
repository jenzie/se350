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

class FoodDB
  def initialize( file )
	@database = Hash.new # stores entire db
	@newItems = Hash.new # stores newly added items
	
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
  # For testing purposes only.
  # Getter for @database
  ##
  attr_accessor :database
  
  def size
    @database.size
  end
  
  def createItem( item )
	if item[1].eql?("b")
	  return BasicFood.new( item[0], item[2] )
	elsif item[1].eql?("r")
	  return Recipe.new( item, @database )
	end
  end
  
  def printAll
    @database.each do |key, value|
	  if value != nil
	    if value.kind_of?( BasicFood )
	      puts value.printItem(1)
	    else
	      puts value.printItem
		end
	  end
	end
  end
  
  def printName( name )
    if !@database.include?( name )
	  puts "Error: '#{name}' does not exist in database."
	else
	  item = @database[ name ]
	  if item.kind_of?( BasicFood )
	    puts item.printItem(1)
      else
	    puts item.printItem
	  end
	end
  end
  
  def findAll( prefix )
    count = 0
    prefix = prefix.downcase
    @database.each do |key, value|
	  temp = key.downcase
	  if temp.start_with?( prefix )
	    count += 1
	    if value.kind_of?( BasicFood )
	      puts value.printItem(1)
	    else
	      puts value.printItem
		end
	  end
	end
	if count == 0
	  puts "No entries found with the prefix '#{prefix}'."
	end
  end
  
  def contains( name )
    name = name.downcase
    @database.each do |key, value|
	  if ( name <=> key.downcase ) == 0
	    return true
	  end
	end
	return false
  end
  
  def addFood( name, calories )
    if contains( name )
      puts "Error: Food entry '#{name}' already exists in database."
	  return
    end
    @database[ name ] = BasicFood.new( name, calories )
	@newItems[ name ] = BasicFood.new( name, calories )
	puts "Success! Food entry '#{name}' was added."
  end
  
  def addRecipe( name, ingredients )
    if contains( name )
      puts "Error: Food entry '#{name}' already exists in database."
	  return
    end
	ingredients.each do |item|
	  if !contains( item )
	    puts "Error: Ingredient '#{item}' does not exist in database."
		return
	  end
	end
	name = name.slice(0,1).capitalize + name.slice(1..-1)
	info = [name, "r"]
	info.concat( ingredients )
	cpy = info.inject([]) { | a, element | a << element.dup }
	@database[ name ] = Recipe.new( info, @database )
	@newItems[ name ] = Recipe.new( cpy, @database )
	puts "Success! Recipe entry '#{name}' was added."
  end
  
  def hasChanges
    return @newItems.length > 0
  end
  
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
  
end # end class