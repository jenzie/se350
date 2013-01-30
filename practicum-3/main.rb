##
# author: Jenny Zhen
# date: 01.30.13
# language: Ruby
# file: main.rb
# assignment: NATO Alphabet (Practicum 03)
#   https://mycourses.rit.edu/d2l/lms/content/viewer/view.d2l?tId=2342072&ou=422264
##

require './phonetic'

p = Phonetic.new
result = ""

input = STDIN.read

# read in each string input
input.each_line do |line|
  if line.start_with?( "A2P" )
    line.slice!(0..3) # remove the "A2P" marker from the string
    result += p.to_phonetic( line ) + "\n"
	
  elsif line.start_with?( "P2A" )
    line.slice!(0..3) # remove the "P2A" marker from the string
    result += p.from_phonetic( line ) + "\n"
  
  # there is no "A2P" or "P2A" marker, so use auto detect
  else
    lineArr = line.split(" ")
	lineArr.each do |word|
      result += p.auto_detect( word )
	end
  end
end

result.strip!
puts result
