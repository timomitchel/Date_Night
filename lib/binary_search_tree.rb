require "./lib/node"

class BinarySearchTree

  attr_reader :root, :depth

  def initialize
    @root = nil
    @depth = 0
  end

  def insert(score, title)
    node = Node.new(score, title)
    @root = node if root.nil?
    if @root == node
      return @depth
    else
    @root.insert(score, title)
    end
  end
end
