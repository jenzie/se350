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

  def test_for_empty_graph
    assert( @myGraph.empty?, "New graph not empty" )
    assert_equal( @myGraph.numVertices, 0 )
  end

  def test_for_addVertex
    @myGraph.addVertex( "one" )
	assert( !@myGraph.empty?, "New graph is empty" )
    assert_equal( @myGraph.numVertices, 1 )
  end

  def test_for_vertex
    @myGraph.addVertex( "one" )
    assert_equal( @myGraph.numVertices, 1 )
    assert( @myGraph.vertex?( "one" ), "Graph contains one node" )
  end
  
  def test_for_addEdge
	@myGraph.addEdge( "one", "two" )
	assert_equal( @myGraph.numVertices, 2 )
	assert( @myGraph.edge?( "one", "two" ), "Graph does not link two to one" )
	assert( !@myGraph.edge?( "two", "one" ), "Graph does link one to two" )
	@myGraph.addEdge( "two" , "one" )
	assert( @myGraph.edge?( "two", "one" ), "Graph does not link one to two" )
	
	@myGraph.addEdge( "three", "one" )
	assert_equal( @myGraph.numVertices, 3 )
	assert( !@myGraph.edge?( "one", "three" ), "Graph does not link three to one" )
	assert( @myGraph.edge?( "three", "one" ), "Graph does not link one to three" )
	assert( !@myGraph.edge?( "three", "two" ), "Graph links two to three" )
	assert( !@myGraph.edge?( "two", "three" ), "Graph links three to two" )
	@myGraph.addEdge( "one", "three" )
	assert( @myGraph.edge?( "one", "three" ), "Graph does not link three to one" )
	
	@myGraph.addEdge( "two", "four" )
	assert_equal( @myGraph.numVertices, 4 )
	assert( !@myGraph.edge?( "four", "two" ), "Graph does not link two to four" )
	assert( @myGraph.edge?( "two", "four" ), "Graph does not link four to two" )
  end
  
  def test_for_outDegree
	@myGraph.addVertex( "zero" )
	assert_equal( @myGraph.outDegree( "zero" ), 0 )
	@myGraph.addEdge( "one", "two" )
	@myGraph.addEdge( "one", "three" )
	@myGraph.addEdge( "one", "four" )
	@myGraph.addEdge( "two", "four" )
	assert_equal( @myGraph.outDegree( "one" ), 3 )
	assert_not_equal( @myGraph.outDegree( "two" ), 3 )
	assert_equal( @myGraph.outDegree( "two" ), 1 )
	assert_equal( @myGraph.outDegree( "three" ), 0 )
  end
  
  def test_for_inDegree
	@myGraph.addVertex( "zero" )
	assert_equal( @myGraph.inDegree( "zero" ), 0 )
	@myGraph.addEdge( "one", "zero" )
	@myGraph.addEdge( "two", "zero" )
	@myGraph.addEdge( "three", "zero" )
	@myGraph.addEdge( "four", "zero" )
	assert_equal( @myGraph.inDegree( "zero" ), 4 )
	assert_equal( @myGraph.inDegree( "one" ), 0 )
	@myGraph.addEdge( "two", "one" )
	@myGraph.addEdge( "three", "one" )
	assert_equal( @myGraph.inDegree( "one" ), 2 )
  end
  
end # end class
