class Node

  attr_reader :score, :title, :depth
  attr_accessor :left, :right

  def initialize(score, title)
    @score = score
    @title = title
    @left = nil
    @right = nil
    @depth = 0
  end

  def insert(node_score, node_title)
    if node_score < @score
      if left.nil?
        @left = Node.new(node_score, node_title)
        @depth += 1
        return @depth
      else
        return @left.insert(node_score, node_title)
      end
    elsif node_score > @score
      if @right.nil?
        @right = Node.new(node_score, node_title)
        @depth += 1
        return @depth
      else
        return @right.insert(node_score, node_title)
      end
    else
      return nil
    end
  end

end
