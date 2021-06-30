module Tree

  class Tree
    attr_reader :root
    attr_reader :posterities
    def initialize
      @posterities = {}
      @root = Node.new(self, 0)
    end

    def find(id)
      @posterities[id]
    end

    def create_node(id, attrs={})
      node = Node.new(self, id, attrs)
      @posterities[node.id] = node
      node
    end

    def to_h
      @root.to_h[:children]
    end

    class Node
      attr_reader :id
      attr_reader :children
      # attr_accessor :parent
      attr_accessor :attributes

      def initialize tree, id, attrs={}
        @tree = tree
        @id = id
        @attributes = attrs
        @children = {}
        # @parent = nil
      end

      def << node
        # return if @tree.posterities.has_key? node.id
        @children[node.id] = node
        # node.parent = self
      end

      def to_h
        ret = @attributes.dup
        ret[:id] = @id
        ret[:children] = []
        @children.values.each do |child|
          ret[:children] << child.to_h
        end
        ret
      end
    end
  end
end