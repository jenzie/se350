require './MovieManager.rb'
require 'test/unit'

class MovieManagerTest < Test::Unit::TestCase

  def test_smokeTest
    testList = MovieList.new
    assert_not_nil( testList, "Should be able to create a MovieList collection")
  end
  
  def test_movie_name
	# test for all lowercase name
	movie01 = Movie.new( "movie01", 1 )
	assert_equal "MOVIE01", movie01.name
	
	# test for all uppercase name
	movie02 = Movie.new( "MOVIE02", 2 )
	assert_equal "MOVIE02", movie02.name
	
	# test for mixed case name
	movie03 = Movie.new( "mOvIe03", 3 )
	assert_equal "MOVIE03", movie03.name
  end
  
  def test_movie_rating
	# test for valid ratings
	movie01 = Movie.new( "movie01", 1 )
	movie02 = Movie.new( "MOVIE02", 10 )
	assert_equal 1, movie01.rating
	assert_equal 10, movie02.rating
	
	# test for no rating provided
	movie03 = Movie.new( "movie03" )
	assert_equal 5, movie03.rating
	
	# test for invalid ratings
	movie04 = Movie.new( "movie04", 0 )
	movie05 = Movie.new( "movie05", 11 )
	assert_equal 5, movie04.rating
	assert_equal 5, movie05.rating
  end
  
  def test_movie_review
	# test for no review provided
	movie01 = Movie.new( "movie01" )
	assert_equal "No Review Entered", movie01.review
	
	# test for a review provided as integer value
	movie02 = Movie.new( "movie02", 1, 1 )
	assert_equal 1, movie02.review
	
	# test for a review provided as string value
	movie03 = Movie.new( "movie03", 1, "This is a review." )
	assert_equal "This is a review.", movie03.review
  end
  
  def test_add_movie
	manager = MovieList.new
  end
end
