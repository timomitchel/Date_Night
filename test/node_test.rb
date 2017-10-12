require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

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

  def test_left_node_set_returns_depth_and_depth_starts_at_0
    node_1 = Node.new(50, 'Gold')


    assert_equal 1, node_1.left_node_set(49, 'Spiderman')
    assert_equal 2, node_1.left_node_set(25, 'Fargo')
    assert_equal 3, node_1.left_node_set(12, 'Batman')
  end

  def test_right_node_set_returns_depth_and_depth_starts_at_0
    node_1 = Node.new(50, 'Gold')

    assert_equal 0, node_1.depth
    assert_equal 1, node_1.right_node_set(58, 'Spiderman')
    assert_equal 2, node_1.right_node_set(60, 'Fargo')
    assert_equal 3, node_1.right_node_set(80, 'Batman')
  end

  def test_insert_returns_depth_and_depth_starts_at_0
    node_1 = Node.new(50, 'Gold')

    assert_equal 0, node_1.depth
    assert_equal 1, node_1.insert(23, 'Superman')
    assert_equal 1, node_1.insert(73, 'Big Daddy')
    assert_equal 2, node_1.insert(45, 'Rainman')
  end

  def test_find_score_returns_node_by_score_or_nil_if_it_does_not_exist
    expected_1 = Node.new(50, 'Gold')
    actual_1 = expected_1.find_score(50)
    expected_2 = Node.new(68, 'It')
    actual_2 = expected_2.find_score(68)

    assert_nil nil, expected_1.find_score(49)
    assert_equal expected_1, actual_1
    assert_nil nil, expected_2.find_score(23)
    assert_equal expected_2, actual_2
  end

  def test_path_correctly_goes_left_or_right
    node_1 = Node.new(50, 'Gold')
    node_1.insert(45, 'Air Bud')


    assert_nil nil, node_1.path(90)
    assert_equal node_1.left, node_1.path(49)

    node_1.insert(55, 'Meet the Fockers')
    assert_equal node_1.right, node_1.path(65)
  end
end
