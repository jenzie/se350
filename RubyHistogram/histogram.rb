##
# author: Jenny Zhen
# date: 01.14.13
# language: Ruby
# file: histogram.rb
# assignment: Intro to Ruby
#	http://www.se.rit.edu/~se350/Class_Activities/11-RubyIntro/index.html
##

if ARGV[0] != nil
  minimum = ARGV[0].to_i
else
  minimum = 2
end

bag = Hash.new(0)
$stdin.each do |line|
  line.chomp!
  line.downcase!
  line.gsub!(/[^a-zA-Z ]/,"")
  line.sub!(/^ +/,"")
  line.split(/ +/).each do |word|
	  bag[word] += 1
  end
end

bag.select! { |key, value| value >= minimum }
sorted = bag.sort_by { |x, y| [ -Integer(y), x ] }
maximum = sorted.inject(0) { |max, el| max = [max, el[0].length].max }
sorted.each { |key| printf "%-#{maximum}s %s\n", key[0], "*" * key[1] }