##
# author: Jenny Zhen
# date: 01.30.13
# language: Ruby
# file: phonetic.rb
# assignment: NATO Alphabet (Practicum 03)
#   https://mycourses.rit.edu/d2l/lms/content/viewer/view.d2l?tId=2342072&ou=422264
##

# Convert to/from phonetic alphabet
# SOLUTION

class Phonetic

  LETTERS = Hash[
             'A', 'ALPHA',
             'B', 'BRAVO',
             'C', 'CHARLIE',
             'D', 'DELTA',
             'E', 'ECHO',
             'F', 'FOXTROT',
             'G', 'GOLF',
             'H', 'HOTEL',
             'I', 'INDIA',
             'J', 'JULIET',
             'K', 'KILO',
             'L', 'LIMA',
             'M', 'MIKE',
             'N', 'NOVEMBER',
             'O', 'OSCAR',
             'P', 'PAPA',
             'Q', 'QUEBEC',
             'R', 'ROMEO',
             'S', 'SIERRA',
             'T', 'TANGO',
             'U', 'UNIFORM',
             'V', 'VICTOR',
             'W', 'WHISKEY',
             'X', 'XRAY',
             'Y', 'YANKEE',
             'Z', 'ZULU'
             ]

  # Translate a line to its phonetic alphabet equivalent
  def to_phonetic(line)
      result = ""	   
	
      line = line.split(//)
	  line.each do |letter|
	    letter.upcase!
		if LETTERS.include?( letter )
	      result += LETTERS[ letter ] + " "
		end
	  end

	  result.strip!
	  return result
  end


  # Translate a sequence of phonetic alphabet code words 
  # to their alphabetic equivalent
  def from_phonetic(line)
    result = ""
	
	line = line.split(" ")
	line.each do |word|
	  word = word.upcase.gsub(/[^0-9A-Za-z]/, '').strip.chomp
	  if LETTERS.value?( word )
	    LETTERS.each do |key, value|
		  if ( ( value <=> word ) == 0 )
		    result += key
		  end
		end
	  end
	end

	return result
  end

  # Auto-detect if the line is phonetic or not. 
  # Does this by checking if the first word is in the phonetic alphabet
  # Delegates to from_phonetic or to_phonetic
  def auto_detect(line)
	  lineArr = line.split(" ")
	  word = lineArr[0].upcase

	  if LETTERS.value?( word )
	    return from_phonetic( line )
	  else
	    return to_phonetic( line )
	  end
  end
end

