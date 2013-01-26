##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: LogItem.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require 'date'
require './Log'

class LogItem

  def initialize( day, item )
    @date = Date._strptime( day, "%Y-%m-%d" )
	@entry = [ item ]
	@count = [ 1 ]
  end
  
  #attr_accessor :entry
  
  def modifyEntry( item )
    if @entry.include?( item )
	  @count[ @entry.index( item ) ] += 1
	else
	  @entry << item
	  @count << 1
	end
  end

end # end class