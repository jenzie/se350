##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: FoodDBTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './FoodDB'
require 'test/unit'

##
# Unit tests for FoodDB.rb.
##
class FoodDBTest < Test::Unit::TestCase

  ##
  # Creates an instance of FoodDB and lists representing file input 
  # for succeeding unit tests.
  ##
  def setup
    @db = FoodDB.new( "FoodDB.txt" )
	@list1 = ["Egg & Sausage","r","Fried Egg","Fried Egg","Sausage","Sausage"]
	@list2 = ["Doritos","b",999]
  end
  
  ##
  # Validates the size of the database.
  ##
  def test_for_size
    assert_equal( @db.size, 40 )
  end
  
  ##
  # Validates the creation of BasicFood and Recipe entries into database.
  ##
  def test_for_createItem
    assert( @db.createItem( @list1 ).kind_of?( Recipe ), 
	  "List1 does not produce a recipe." )
	assert( @db.createItem( @list2 ).kind_of?( BasicFood ), 
	  "List2 does not produce a basic food." )
  end
  
  ##
  # Validates the string containing the information for all entries in 
  # the database to be printed correctly.
  ##
  def test_for_printAll
    assert_equal( @db.printAll,
      "Orange 67\nBread Slice 80\nPeanut Butter 175\nJelly 155\nCandy 5\nGum 5\nHam 20\nCheese Slice 20\nMayonnaise 15\nPlain Bagel 90\nCream Cheese 30\nBlueberry Muffin 100\nCorn Muffin 80\nEnglish Muffin 80\nFried Egg 80\nSausage 80\nIce Cream 200\nSteak 800\nMuffin with Egg & Sausage 320\n  English Muffin 80\n  Fried Egg (2) 160\n  Sausage 80\nBagel with Cream Cheese 120\n  Plain Bagel 90\n  Cream Cheese 30\nGrilled Cheese 200\n  Bread Slice (2) 160\n  Cheese Slice (2) 40\nHam & Cheese 215\n  Bread Slice (2) 160\n  Ham 20\n  Cheese Slice 20\n  Mayonnaise 15\nPB&J Sandwich 490\n  Bread Slice (2) 160\n  Peanut Butter 175\n  Jelly 155\nLots of Ham Sandwich 300\n  Ham (6) 120\n  Bread Slice (2) 160\n  Cheese Slice 20\nBeer 120\nWine 200\nWine & Cheese 220\n  Wine 200\n  Cheese Slice 20\nGin 150\nTonic 150\nGin & Tonic 300\n  Gin 150\n  Tonic 150\nTequila 60\nLime Wedge 20\nSalt 1\nTequila & Lime 81\n  Tequila 60\n  Salt 1\n  Lime Wedge 20\nBaileys 200\nKahlua 100\nVodka 100\nWhite Russian 400\n  Vodka 100\n  Baileys 200\n  Kahlua 100\nWay Too Much Alcohol 1121\n  Beer 120\n  Wine & Cheese 220\n    Wine 200\n    Cheese Slice 20\n  Gin & Tonic 300\n    Gin 150\n    Tonic 150\n  Tequila & Lime 81\n    Tequila 60\n    Salt 1\n    Lime Wedge 20\n  White Russian 400\n    Vodka 100\n    Baileys 200\n    Kahlua 100\nEven More Alcohol 7126\n  Way Too Much Alcohol (6) 1121\n    Beer 120\n    Wine & Cheese 220\n      Wine 200\n      Cheese Slice 20\n    Gin & Tonic 300\n      Gin 150\n      Tonic 150\n    Tequila & Lime 81\n      Tequila 60\n      Salt 1\n      Lime Wedge 20\n    White Russian 400\n      Vodka 100\n      Baileys 200\n      Kahlua 100\n  Gin & Tonic 300\n    Gin 150\n    Tonic 150\n  Kahlua 100\n" )
  end
  
  ##
  # Validates the string containing the information for a single 
  # food entry in the database is printed correctly.
  ##
  def test_for_printName
    assert_equal( @db.printName( "beer" ), "Beer 120\n" )
	assert_equal( @db.printName( "wine" ), "Wine 200\n" )
	assert_equal( @db.printName( "candy" ), "Candy 5\n" )
  end
  
  ##
  # Validates the string containing the information for all of the 
  # food entries with the given prefix is printed correctly.
  ##
  def test_for_findAll
    assert_equal( @db.findAll( "s" ),
	  "Sausage 80\nSteak 800\nSalt 1\n" )
	assert_equal( @db.findAll( "wine" ),
	  "Wine 200\nWine & Cheese 220\n  Wine 200\n  Cheese Slice 20\n" )
	assert_equal( @db.findAll( "c" ),
	  "Candy 5\nCheese Slice 20\nCream Cheese 30\nCorn Muffin 80\n" )
  end
  
  ##
  # Validates that the database does/does not contain the food entry.
  ##
  def test_for_contains
    assert( @db.contains( "Gum" ),
	  "Database does not contain 'Gum'." )
	assert( !@db.contains( "Paper" ),
	  "Database contains 'Paper'." )
	assert( @db.contains( "PB&J Sandwich" ),
	  "Database does not contain 'PB&J Sandwich'." )
	assert( @db.contains( "bread Slice" ),
	  "Database does not contain 'bread Slice'." )
  end
  
  ##
  # Validates that a BasicFood entry can be added to the database 
  # based on user input if it does not exist.
  ##
  def test_for_addFood
    @db.addFood( "Marshmallow", 10 )
	assert( @db.contains( "Marshmallow" ),
	  "Database does not contain 'Marshmallow'." )
	assert_equal( @db.size, 41 )
	@db.addFood( "Gum", 1000 )
	assert( @db.contains( "Gum" ),
	  "Database does not contain 'Gum'." )
	assert( @db.size == 41, "'Gum' was added to database twice." )
	@db.addFood( "Skittle", -5 )
	assert( !@db.contains( "Skittle" ),
	  "Database does not contain 'Skittle'." )
	assert_equal( @db.size, 41 )
  end
  
  ##
  # Validates that a Recipe entry can be added to the database
  # based on user input if it does not exist.
  ##
  def test_for_addRecipe
    list1 = ["Plain Bagel", "Jelly", "Jelly"]
    @db.addRecipe( "Jelly Bagel", list1 )
	assert( @db.contains( "Jelly Bagel" ),
	  "Database does not contain 'Jelly Bagel'." )
	assert_equal( @db.size, 41 )
	
	list2 = ["Candy", "Candy", "Gum", "Gum", "M&M"]
	@db.addRecipe( "Sugar Delight", list2 )
	assert( !@db.contains( "Sugar Delight" ),
	  "Database added 'Sugar Delight' but 'M&M' is an invalid ingredient." )
	assert_equal( @db.size, 41 )
	
	list3 = ["Cheese Slice"]
	@db.addRecipe( "Cheeeeeeeeeese", list3 )
	assert( @db.contains( "Cheeeeeeeeeese" ),
	  "Database does not contain 'Cheeeeeeeeeese'." )
	assert_equal( @db.size, 42 )
  end
  
  ##
  # Validates that changes to the database are added to the "queue"
  # correctly.
  ##
  def test_for_changes	
    list1 = ["Plain Bagel", "Jelly", "Jelly"]
    @db.addRecipe( "Jelly Bagel", list1 ) # success
	assert_equal( @db.getChanges.length, 1 )
	
	list2 = ["Candy", "Candy", "Gum", "Gum", "M&M"]
	@db.addRecipe( "Sugar Delight", list2 ) # fail
	assert_equal( @db.getChanges.length, 0 )
  end
  
end # end class