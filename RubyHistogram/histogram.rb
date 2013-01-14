##
# author: Jenny Zhen
# date: 01.14.13
# language: Ruby
# file: histogram.rb
# assignment: Intro to Ruby
#	http://www.se.rit.edu/~se350/Class_Activities/11-RubyIntro/index.html
##

bag = Hash.new(0)
$stdin.each.do |line|
	puts line
	line.chomp!
	line.downcase!
	line.gsub!(/[^a-zA-Z ]/,"")
	line.sub!(/^ +/,"")
	line.split(/ +/).each do |word|
		bag[word] += 1
	end
end
puts bag
