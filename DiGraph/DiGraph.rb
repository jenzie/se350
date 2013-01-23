##
# author: Jenny Zhen
# date: 01.21.13
# language: Ruby
# file: DiGraph.rb
# assignment: DiGraph.rb
#   http://www.se.rit.edu/~se350/Class_Activities/14_RubyUnit/RubyDiGraph.html
#
# DiGraph - Implements a directed graph using an adjacency list
#
# T. Reichlmayr - 01/26/07
# M. Lutz - 4/20/2011
##

class DiGraph 
  # Create the mapping hash from known vertices to an array
  # of immediate neighbors.

  def initialize
    # Hash of vertices, mapping each vertex to its immediate neighbors
    @vertices = Hash.new
  end

  # Add a vertex to the graph.  If the vertex has already been added
  # to the graph, it will not be added a second time.

  def addVertex (name)
    @vertices[name] ||= Array.new
  end

  # Add an edge to the graph.  The end vertices of the edge will
  # be added to the graph if necessary.
  # We should never connect two vertices with more than one edge.
 
  def addEdge( from_vertex, to_vertex)
    addVertex( from_vertex )
    addVertex( to_vertex )
    @vertices[from_vertex] << to_vertex
  end

  # Is name the label of a vertex?
 
  def vertex? ( name )
    @vertices.has_key?(name)
  end
    
  # Is the graph empty?

  def empty?
    @vertices.empty?
  end
    
  # How many vertices do we have?

  def numVertices
    @vertices.size
  end

  # Is there a direct edge leading from one
  # vertex to another?

  def edge?( from, to )
    @vertices[ from ].include?( to )
  end
  
  # How many outgoing edges are there for vertex name?
  # If name is unknown, then this is 0.
 
  def outDegree( name )
	if vertex?( name )
		return @vertices[ name ].size
	end
	return 0
  end
  
  # How many incoming edges are there for vertex name?
  # If name is unknown, then this is 0.
 
  def inDegree( name )
	count = 0
    if vertex?( name )
		@vertices.each_key{ |key| if edge?( key, name ) then count += 1 end}
	end
	return count
  end
  
end # end class
