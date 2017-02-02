gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/binary_search_tree'
require_relative '../lib/node'

class NodeTest < Minitest::Test
  def test_can_create_object
    node = Node.new(1, "movie title")
    assert_instance_of Node, node
  end

  def test_node_has_score_and_title
    node = Node.new(1, "movie title")
    assert_equal 1, node.score
    assert_equal "movie title", node.title
  end

  def test_node_can_have_left_right_nodes
    node1 = Node.new(10, "movie title")
    node2 = Node.new(5, "other title")
    node3 = Node.new(15, "another title")
    node1.right = node2
    node1.left =  node3
    assert_equal node1.right, node2
    assert_equal node1.left, node3
  end



end
