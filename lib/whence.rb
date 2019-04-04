require "whence/version"
require "set"

module Whence
  def self.whence
    if $callers == nil
      $callers = []
    end
    $callers << caller
  end

  def self.tree
    g = Graph.new($callers.length)
    $callers.each do |trace|
      trace.each.inject(g) do |memo, location|
        Vertex.new(location).tap do |child|
          memo << child
        end
      end
    end
    puts g
  end

  class Edges < SimpleDelegator
    def initialize
      super(Hash.new)
    end

    def <<(element)
      self[element] ||= 0
      self[element] += 1
    end
  end

  class Vertex
    attr_reader :location, :name

    def initialize(location)
      @location = location
      @edges = Edges.new
    end

    def <<(vertex)
      @edges << vertex
    end

    def to_s(weight, last = true, indent = [])
      my_indent = indent.dup
      child_indent = indent.dup
      if last
        my_indent.append("└")
        child_indent.append("  ")
      else
        my_indent.append("├")
        child_indent.append("│ ")
      end

      my_indent.join + " #{location} #{weight}\n" +
        @edges.each_with_index.map do |vertex_and_weight, i|
          vertex, weight = *vertex_and_weight
          vertex.to_s(weight, i == @edges.count - 1, child_indent)
      end.join
    end
  end

  class WeightedDirectedAcyclicGraph < SimpleDelegator
    def initialize(weight)
      __setobj__ nil
      @weight = weight
    end

    def <<(vertex)
      if __getobj__
        super
      else
        __setobj__(vertex)
      end
    end

    def to_s
      __getobj__.to_s(@weight)
    end
  end

  Graph = WeightedDirectedAcyclicGraph
end
