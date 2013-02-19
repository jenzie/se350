# Movie Manager 
# 
# Manages a collection of movie objects. 
# 
# Name:
#
# Change Log - Identify the modifications made to the orginal code
# (1) - line 30 - decremented the number of movies when deleting
# (2) - lines 29-32 - added check to see if movie exists before deleting
# (3) - line 40 - changed line to sort by key and return list of movie names
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
    @movies.store(movieToAdd.name, movieToAdd)
    @numberOfMovies += 1  
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
    list = @movies.values.sort_by { |x| x.rating }
  end    
    
 end

# Movie Class - Models a movie entry - maintains movie title as an uppercase string,
#                     rating (1-10) and text review.
#
# Change Log - Identify the modifications made to the orginal code
# (1) - line 56 - added attr_reader to access the name of the movie
# (2) - line 61 - changed to default the rating to 5, if none provided
# (3) - lines 70-71 - added default value to rating if input out of bounds
# (4) - line 68 - changed logic error when checking bounds to be use 'AND'
# (n) -  

class Movie
	attr_reader :name
    attr_reader :rating
    attr_reader :review
    attr_writer :review
      
    def initialize( aName, aRating=5, aReview="No Review Entered" )
        @name=aName.upcase
		self.rating=aRating
		@review=aReview
    end

    def rating=(value)
		if value <=10 && value >=1 
			@rating = value
		else
			@rating = 5
		end
    end
end
