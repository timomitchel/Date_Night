require "pry"
require "minitest/autorun"
require "minitest/pride"
require "./lib/node"
require "./lib/binary_search_tree"

class BinarySearchTreeTest < Minitest::Test

  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, tree
  end

  def test_tree_root_starts_as_nil
    assert_nil tree.root
  end

  def test_insert_method_returns_correct_tree_depth
    depth_1 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    depth_2 = tree.insert(16, "Johnny English")
    depth_3 = tree.insert(92, "Sharknado 3")
    depth_4 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, tree.depth
    assert_equal 0, depth_1
    assert_equal 1, depth_2
    assert_equal 1, depth_3
    assert_equal 2, depth_4
  end

  def test_include_returns_true_or_false
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(16)
    refute tree.include?(72)
    assert tree.include?(61)
    refute tree.include?(424800852)
    refute tree.include?("timo")
  end

  def test_depth_of_tree_nodes
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, tree.depth_of(61)
    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
  end

  def test_max_returns_node_with_highest_score_as_hash
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3" => 92}), tree.max
  end

  def test_min_returns_node_with_lowest_score_as_hash
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English" => 16}), tree.min
  end

  def test_sort_returns_array_of_movies_in_ascending_order
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}], tree.sort
  end

  def test_load_returns_the_numbers_inserted_into_the_tree_and_ignores_duplicates
    new_tree = BinarySearchTree.new
    assert_equal 99, new_tree.load('./lib/movies.txt')
  end

  def test_transform_file_returns_length_of_array
    from_file_example = ["71, Hannibal Buress: Animal Furnace\n", "80, Hannibal Buress: Comedy Camisado\n",
                          "17, Meet My Valentine\n", "55, Experimenter\n"]
    assert_equal 4, tree.transform_file_to_inserted_nodes(from_file_example)
  end

  def test_delete_depths_only_returns_hash_elements_of_an_array_and_length
    without_hashes = ["71, Hannibal Buress: Animal Furnace\n", "80, Hannibal Buress: Comedy Camisado\n",
                          "17, Meet My Valentine\n", "55, Experimenter\n"]
    with_hashes = [{3=>'timo'}, 45, 'hi', {'score'=> 'movies'}]

    assert_equal 0, tree.grab_hashes(without_hashes)
    assert_equal 2, tree.grab_hashes(with_hashes)
  end

  def test_health_returns_array_of_score_total_child_nodes_and_percent_of_this_node_and_its_child_over_total_nodes
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

  def test_percentage_returns_integer_with_correct_percentage
    assert_equal 100, tree.percentage(7,7)
    assert_equal 85, tree.percentage(6,7)
    assert_equal 0, tree.percentage(0,7)
  end

  def test_sort_for_health_edge_cases
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_nil nil, tree.sort_for_health(nil)
  end

  def test_sort_for_health_returns_array_of_nodes_as_hashes_sorted_by_score
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal 7, tree.sort_for_health(tree.root).length
    assert_equal [36], tree.sort_for_health(tree.root).first.values
    assert_equal [98], tree.sort_for_health(tree.root).last.values
  end

  def test_depth_sort_returns_array_of_nodes
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal 69, tree.depth_sort(4).first.score
    assert_equal "Charlie's Angels", tree.depth_sort(3).last.title
  end

  def test_depth_sort_edge_cases
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_nil nil, tree.depth_sort(nil)
    assert_equal [], tree.depth_sort(100)
  end


end
