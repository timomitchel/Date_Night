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

  def include?(score_check)
    return true if score_check == @root.score
    return false if @root.nil?
    path_to_node_object(score_check)
  end

  def path_to_node_object(score_check)
    current_node = @root.find_score(score_check)
    if current_node.nil?
      false
    else
      true
    end
  end
end

# tree = BinarySearchTree.new
# tree.insert(61, "Bill & Ted's Excellent Adventure")
# tree.insert(16, "Johnny English")
# tree.insert(92, "Sharknado 3")
# tree.insert(50, "Hannibal Buress: Animal Furnace")
#
# puts tree.root.left.right.score
