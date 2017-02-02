require 'pry'
gem 'minitest'
require 'minitest/autorun'
require_relative 'binary_search_tree'
require_relative 'node'


class DateNightTest < Minitest::Test
  def test_object_is_binary_search_tree
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_has_root_node
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    assert tree.root_node
    assert_equal 50, tree.root_node.score
    assert_equal tree.root_node.title, "movie"
  end

  def test_insert_root_node_has_right_node
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    tree.insert(60, "larger")
    assert_equal tree.root_node.right.title, "larger"
  end

  def test_insert_root_node_has_left_node
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    tree.insert(40, "smaller")
    assert_equal tree.root_node.left.title, "smaller"
  end

  def test_insert_root_node_has_left_and_right_nodes
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    tree.insert(40, "smaller")
    tree.insert(60, "larger")
    assert_equal tree.root_node.left.title, "smaller"
    assert_equal tree.root_node.right.title, "larger"
  end

  def test_left_node_has_right_node
    tree = BinarySearchTree.new
    tree.insert(50, "root")
    tree.insert(60, "root-right")
    tree.insert(40, "root-left")
    tree.insert(45, "root-left-right")
    tree.insert(35, "root-left-left")
    tree.insert(46, "root-right-right")
    tree.insert(36, "root-left-left-right")
    assert_equal "root", tree.root_node.title
    assert_equal "root-left-right", tree.root_node.left.right.title
  end

  def test_from_project_specs
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal "Bill & Ted's Excellent Adventure", tree.root_node.title
    assert_equal "Johnny English", tree.root_node.left.title
    assert_equal "Hannibal Buress: Animal Furnace", tree.root_node.left.right.title
  end

  def test_include_one_single_item_returns_only_root
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal true, tree.include?(61)
  end

  def test_include_many_items
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal true, tree.include?(50)
  end

  def test_include_false_returns_false
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal true, tree.include?(61)
    refute tree.include?(14), "this should return false"
  end

  def test_include_false_returns_false_with_many_items
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal true, tree.include?(61)
    refute tree.include?(14), "this should return false"
  end

  def test_root_node_has_depth_of_0
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 0, tree.depth_of(61)
  end

  def test_non_root_node_has_depth_of_1
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 1, tree.depth_of(92)
  end

end
