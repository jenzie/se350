##
# author: Jenny Zhen
# date: 01.21.13
# language: Ruby
# file: DiGraphTest.rb
# assignment: DiGraph
#   http://www.se.rit.edu/~se350/Class_Activities/14_RubyUnit/RubyDiGraph.html
##

require './DiGraph'
require 'test/unit'

class DiGraphTest < Test::Unit::TestCase

  # Create a new graph for the next test

  def setup
    @myGraph = DiGraph.new
  end

  # Is a new graph empty?
  # Does it have size zero?

  def test_for_empty_graph
    assert( @myGraph.empty?, "New graph not empty")
    # ... size test here ...
  end

  def test_for_addVertex
    @myGraph.addVertex( "one" )
    assert_equal( @myGraph.numVertices, 1 )
  end

  def test_for_vertex
    assert( @myGraph.vertex?( "one" ), "Graph contains one node")
  end
  
end
