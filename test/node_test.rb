require "pry"
require "minitest/autorun"
require "minitest/pride"
require "./lib/node"
require "./lib/binary_search_tree"

class NodeTest < Minitest::Test

  def test_node_class_exists
    node = Node.new(99, 'Cruel Intentions')

    assert_instance_of Node, node
  end

end
