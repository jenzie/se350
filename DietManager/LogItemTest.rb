##
# author: Jenny Zhen
# date: 02.03.13
# language: Ruby
# file: LogItemTest.rb
# assignment: Diet Manager (Project 03)
#   http://www.se.rit.edu/~se350/Projects/Project3/index.html
##

require './LogItem'
require 'test/unit'

class LogItemTest < Test::Unit::TestCase

  def setup
    @item = LogItem.new( )
  end

end # end class