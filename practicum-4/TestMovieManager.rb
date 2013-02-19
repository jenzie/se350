require './MovieManager.rb'
require 'test/unit'

class MovieManagerTest < Test::Unit::TestCase

  def test_smokeTest
    testList = MovieList.new
    assert_not_nil( testList, "Should be able to create a MovieList collection")
  end
  
end 
