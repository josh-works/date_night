

class Node
  attr_reader :score, :title
  attr_accessor :left, :right

  def initialize(score, title)
    @score = score
    @title = title
    @left = nil
    @right = nil
  end

  def insert(score, title)
    if score > @score && @right.nil?
      @right = Node.new(score, title)
    elsif score > @score && @right
      @right.insert(score, title)
    elsif score < @score && @left.nil?
      @left = Node.new(score, title)
    elsif score < @score && @left
      @left.insert(score, title)
    end
  end

  def include?(score)
    return true if @score == score
    if score > @score
      @right.include?(score)
    elsif score < @score
      @left.include?(score)
    end
  end
end
