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

  def left_node_set(node_score, node_title)
    if left.nil?
      @left = Node.new(node_score, node_title)
      @depth += 1
      return @depth
    else
      return @left.insert(node_score, node_title)
    end
  end

  def right_node_set(node_score, node_title)
    if @right.nil?
      @right = Node.new(node_score, node_title)
      @depth += 1
      return @depth
    else
      return @right.insert(node_score, node_title)
    end
  end

  def insert(node_score, node_title)
    if node_score < @score
      left_node_set(node_score, node_title)
    elsif node_score > @score
      right_node_set(node_score, node_title)
    else
      return nil
    end
  end

  def find_score(score_check)
    return self if score_check == @score
    if score_check < @score
      path = @left
    else
      path = @right
    end
    if path.nil?
      return nil
    else
      path.find_score(score_check)
    end
  end
end
