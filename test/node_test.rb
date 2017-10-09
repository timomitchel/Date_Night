require "pry"
require "minitest/autorun"
require "minitest/pride"
require "./lib/node"
require "./lib/binary_search_tree"

class NodeTest < Minitest::Test

  attr_reader :node
  def setup
    @node = Node.new(99, 'Cruel Intentions')
  end

  def test_node_class_exists
    assert_instance_of Node, node
  end

  def test_initialize_variables
    assert_equal 99, node.score
    assert_equal 'Cruel Intentions', node.title
    assert_nil nil, node.left
    assert_nil nil, node.right
    assert_equal 0, node.depth
  end

end
