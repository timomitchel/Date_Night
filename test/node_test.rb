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

  def test_left_node_set_returns_depth
    node_1 = Node.new(50, 'Gold')


    assert_equal 1, node_1.left_node_set(49, 'Spiderman')
    assert_equal 2, node_1.left_node_set(25, 'Fargo')
    assert_equal 3, node_1.left_node_set(12, 'Batman')
  end

  def test_right_node_set_returns_depth
    node_1 = Node.new(50, 'Gold')


    assert_equal 1, node_1.right_node_set(58, 'Spiderman')
    assert_equal 2, node_1.right_node_set(60, 'Fargo')
    assert_equal 3, node_1.right_node_set(80, 'Batman')
  end
end
