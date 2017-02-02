require 'pry'
require_relative 'node'


class BinarySearchTree
  attr_reader :root_node
  def initialize
    @scores = []
    @depth = 0
    @root_node = nil
    @current_node = nil
  end

  def insert(incoming_score, title)
    # after first node, no more call back to root
    # user `current` to track "current" node
    if @root_node.nil?
      @root_node = Node.new(incoming_score, title)
      @current_node = @root_node
    else @current_node.insert(incoming_score, title)
    end
  end

# most of this in node class
  def include?(score)
    if @root_node.score == score
      true
    else @root_node.include?(score)
    end
  end


end
# https://github.com/turingschool/ruby-submissions/tree/master/1608-b/1module/date_night
