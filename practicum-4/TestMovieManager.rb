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
	# movie instances to add to list
	movie01 = Movie.new( "movie01" )
	movie02 = Movie.new( "movie02", 1, 1 )
	movie03 = Movie.new( "movie03", 1, "This is a review." )
	movie04 = Movie.new( "movIE01" )
	
	# create the movie list
	manager = MovieList.new
	assert_equal 0, manager.size
	
	# adding the movies to the list
	manager.add( movie01 )
	manager.add( movie02 )
	manager.add( movie03 )
	
	# test the size
	assert_equal 3, manager.size
	
	# adding an existing movie to the list
	manager.add( movie04 )
	
	# test the size
	assert_equal 3, manager.size
  end
  
  def test_get_movie
	# movie/movielist instances
	movie01 = Movie.new( "movie01" )
	movie02 = Movie.new( "movie02", 1, 1 )
	manager = MovieList.new
	
	# adding the movies to the list
	manager.add( movie01 )
	manager.add( movie02 )
	
	# get the movies added to the list
	assert_equal "MOVIE01", manager.getMovie( "movie01" ).name
	assert_equal "MOVIE02", manager.getMovie( "movie02" ).name
	
	# get a movie not on the list
	assert_nil manager.getMovie( "unknown" )
  end
  
  def test_delete_movie
	# movie/movielist instances
	movie01 = Movie.new( "movie01" )
	movie02 = Movie.new( "movie02", 1, 1 )
	manager = MovieList.new
	
	# adding the movies to the list
	manager.add( movie01 )
	manager.add( movie02 )
	assert_equal 2, manager.size
	
	# deleting a movie on the list
	manager.delete( "movie01" )
	assert_equal 1, manager.size
	
	# deleting a movie not on the list
	manager.delete( "unknown" )
	assert_equal 1, manager.size
  end
  
  def test_sort_name
	# movie/movielist instances
	movie01 = Movie.new( "a" )
	movie02 = Movie.new( "b" )
	movie03 = Movie.new( "c" )
	movie04 = Movie.new( "d" )
	manager = MovieList.new
	
	# adding the movies to the list
	manager.add( movie04 )
	manager.add( movie03 )
	manager.add( movie02 )
	manager.add( movie01 )
	
	# check if list is sorted by name in ascending alphabetical order
	assert_not_equal [ "D", "C", "B", "A" ], manager.sortByName
	assert_equal [ "A", "B", "C", "D" ], manager.sortByName
	
	
	# movie/movielist instances
	movie05 = Movie.new( "Alpha2" )
	movie06 = Movie.new( "Alpha1" )
	manager = MovieList.new
	
	# adding the movies to the list
	manager.add( movie05 )
	manager.add( movie06 )
	
	# check if list is sorted by name in ascending alphabetical order
	assert_equal [ "ALPHA1", "ALPHA2" ], manager.sortByName
  end
  
  def test_sort_rating
	# movie/movielist instances
	movie01 = Movie.new( "movie01", 1 )
	movie02 = Movie.new( "MOVIE02", 2 )
	movie03 = Movie.new( "mOvIe03", 3 )
	manager = MovieList.new
	
	# adding the movies to the list
	manager.add( movie01 )
	manager.add( movie02 )
	manager.add( movie03 )
	
	# check if list is sorted by rating in descending numerical order
	assert_equal [ movie03, movie02, movie01 ], manager.sortByRating
  end
end
