##
# author: Jenny Zhen
# date: 01.23.13
# language: Ruby
# file: churn.rb
# assignment: Churn - SVN Log Analysis
#   http://www.se.rit.edu/~se350/Class_Activities/RubyScripting/analyzingSVNLog.html
##

require 'date'

#Validate date from command line arguments
date = ARGV[0]
if (date =~ /[0-9]{4}-[0-9]{2}-[0-9]{2}/ && Date.parse(date) <= Date.today())

  #Retrieve list of files and directories in SVN repository
  svnDirs = `svn list https://sdcc.svn.sourceforge.net/svnroot/sdcc/trunk/sdcc/src`.split("\n")

  #Iterate through array of SVN list and add each directory to an array
  dirs = Array.new
  svnDirs.each { |file|
    if (file.index("/") != nil)
      dirs.push(file)
    end 
  }
  
  #Parse the SVN log for the given date
  hash = Hash.new(0)
  dirs.each{ |dir|
    result = `svn log --revision 'HEAD:{#{date}}' https://sdcc.svn.sourceforge.net/svnroot/sdcc/trunk/sdcc/src/#{dir}`.split("\n")
    count = 0
    result.each{|line|
      if (line =~ /^.*r\d.*$/)
        count = count + 1
      end
    }
    hash[dir] = count
  }
  
  #Scale the value of each directory for the histogram 
  weight = Hash.new(0)
  scale = 4 
  max = 0
  
  #Determine max value
  hash.each{|key, value|
    if (value > max) 
      max = value
    end
  }
  
  #Use max value to scale the weight (using floating point arithmetic to avoid truncation to 0)
  hash.each{|key, value| 
    weight[key] = ((scale.to_f * value.to_f) / max.to_f).round
  }
    
  #Sort the histogram alphabetically
  hash = hash.sort{|v1, v2| v1[0] <=> v2[0]} 
  
  #Determine longest size using inject
  longest = hash.inject([""]) do |memo, word|
    memo[0].length >= word[0].length ? memo : word
  end
  
  #Print out header and histogram
  puts "Changes since #{date}:"
  hash.each{|key, value| printf("%#{longest[0].length}.#{longest[0].length}s %s (%d)\n", key.sub("/", ""), "*" * weight[key], value)}

else
  
  #Display error message if timestamp incorrectly formatted or greater than current
  puts "Invalid timestamp."
end
