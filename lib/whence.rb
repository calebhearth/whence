require "whence/version"

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
      trace.reverse_each.inject(g) do |memo, trace_line|
        location, name = trace[0].split("in: ")
        Vertex.new(location, name).tap do |child|
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

    def initialize(location, name)
      @location, @name = location, name
      @edges = Edges.new
    end

    def <<(vertex)
      @edges << vertex
    end

# func (n Node) Print(leaders []string) {
#   for i, part := range keys {
#     for _, l := range leaders {
#       fmt.Print(l)
#     }
#     if i == len(keys)-1 {
#       fmt.Printf("%s %s\n", "└──", part)
#       n[part].Print(append(leaders, "    "))
#     } else {
#       fmt.Printf("%s %s\n", "├──", part)
#       n[part].Print(append(leaders, "│   "))
#     }
#   }
# }
    def to_s(weight, last = true, indent = [])
      my_indent = indent
      child_indent = indent
      if last
        my_indent.append("└── ")
        child_indent.append("    ")
      else
        my_indent.append("├── ")
        child_indent.append("│   ")
      end
      my_indent.join + "#{location} #{weight}\n" +
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
      __setobj__(vertex) unless __getobj__
      super
    end

    def to_s
      __getobj__.to_s(@weight)
    end
  end

  Graph = WeightedDirectedAcyclicGraph
end
