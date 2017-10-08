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
    return nil if score_check.is_a? String
    result = path(score_check)
    if result.nil?
      return nil
    else
      result.find_score(score_check)
    end
  end

  def path(score_check)
    if score_check < @score
      @left
    else
      @right
    end
  end
end
