##
# author: Jenny Zhen
# date: 02.19.13
# language: Ruby
# file: MovieManager.rb
# assignment: Movie Manager (Practicum 04)
#   http://www.se.rit.edu/~se350/Practicum-4-nsheyybsbw/FinalPracticum.htm
##

# Movie Manager 
# Manages a collection of movie objects. 
#
# Change Log - Identify the modifications made to the orginal code
# (1) - line 34 - decremented the number of movies when deleting
# (2) - lines 32-35 - added check to see if movie exists before deleting
# (3) - line 43 - changed line to sort by key and return list of movie names
# (4) - line 47 - changed line to reverse the sorted list to descending order
# (n) -

class MovieList
  def initialize
    @movies = Hash.new
    @numberOfMovies = 0    
  end
  
  def size
    @numberOfMovies
   end
  
  def add(movieToAdd)
	if !getMovie(movieToAdd.name)
		@movies.store(movieToAdd.name, movieToAdd)
		@numberOfMovies += 1  
	end
  end
  
  def delete(movieToDelete)
	if getMovie(movieToDelete)
		@movies.delete(movieToDelete.upcase)
		@numberOfMovies -= 1
	end
  end
  
  def getMovie(movieToFind)    
    @movies.fetch(movieToFind.upcase, nil) 
  end
  
  def sortByName	
    list = @movies.keys.sort
  end
  
  def sortByRating
    list = @movies.values.sort_by { |x| x.rating }.reverse!
  end    
    
 end

# Movie Class - Models a movie entry - maintains movie title as an uppercase string,
#                     rating (1-10) and text review.
#
# Change Log - Identify the modifications made to the orginal code
# (1) - line 64 - added attr_reader to access the name of the movie
# (2) - line 69 - changed to default the rating to 5, if none provided
# (3) - lines 78-79 - added default value to rating if input out of bounds
# (4) - line 76 - changed logic error when checking bounds to be use 'AND'
# (5) - line 72 - changed the review to convert to a string
# (n) -  

class Movie
	attr_reader :name
    attr_reader :rating
    attr_reader :review
    attr_writer :review
      
    def initialize( aName, aRating=5, aReview="No Review Entered" )
        @name=aName.upcase
		self.rating=aRating
		@review=aReview.to_s
    end

    def rating=(value)
		if value <=10 && value >=1 
			@rating = value
		else
			@rating = 5
		end
    end
end
