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
    assert_equal "movie", tree.root_node.title
  end

  def test_insert_root_node_has_right_node
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    tree.insert(60, "larger")
    assert_equal "larger", tree.root_node.right.title
  end

  def test_insert_root_node_has_left_node
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    tree.insert(40, "smaller")
    assert_equal "smaller", tree.root_node.left.title
  end

  def test_insert_root_node_has_left_and_right_nodes
    tree = BinarySearchTree.new
    tree.insert(50, "movie")
    tree.insert(40, "smaller")
    tree.insert(60, "larger")
    assert_equal "smaller", tree.root_node.left.title
    assert_equal "larger", tree.root_node.right.title
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
    assert_equal tree.root_node.title, "root"
    assert_equal tree.root_node.left.right.title, "root-left-right"
  end

  def test_from_project_specs
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.root_node.title, "Bill & Ted's Excellent Adventure"
    assert_equal tree.root_node.left.title, "Johnny English"
    assert_equal tree.root_node.left.right.title, "Hannibal Buress: Animal Furnace"
  end

  def test_include_one_single_item_returns_root
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal tree.include?(61), true
  end

  def test_include_many_items
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal true, tree.include?(50)
  end

end
