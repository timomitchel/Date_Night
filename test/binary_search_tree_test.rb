require "pry"
require "minitest/autorun"
require "minitest/pride"
require "./lib/node"
require "./lib/binary_search_tree"

class BinarySearchTreeTest < Minitest::Test

  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, tree
  end

  def test_tree_root_starts_as_nil
    tree = BinarySearchTree.new
    assert_nil tree.root
  end

  def test_insert_method_returns_correct_tree_depth
    tree_1 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree_2 = tree.insert(16, "Johnny English")
    tree_3 = tree.insert(92, "Sharknado 3")
    tree_4 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, tree.depth
    assert_equal 0, tree_1
    assert_equal 1, tree_2
    assert_equal 1, tree_3
    assert_equal 2, tree_4
  end

  def test_include_returns_true_or_false
    assert tree.include?(16)
    refute tree.include?(72)
    assert tree.include?(61)
    refute tree.include?(424800852)
    refute tree.include?("timo")
  end

  def test_depth_of_tree_nodes
    assert_equal 0, tree.depth_of(61)
    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
  end

  def test_max_returns_node_with_highest_score_as_hash
    assert_equal ({"Sharknado 3" => 92}), tree.max
  end

  def test_min_returns_node_with_lowest_score_as_hash
    assert_equal ({"Johnny English" => 16}), tree.min
  end

  def test_sort_returns_array_of_movies_in_ascending_order
    assert_equal [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}], tree.sort
  end

  def test_load_returns_the_numbers_inserted_into_the_tree_and_ignores_duplicates
    assert_equal 26, tree.load('./lib/movies.txt')
  end

  def test_health_returns_array_of_score_total_child_nodes_and_percent_of_this_node_and_its_child_over_total_nodes
    skip
    #ignore setup
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end


end
