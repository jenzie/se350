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
  
end
