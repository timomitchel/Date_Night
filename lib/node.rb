class Node

  attr_reader :score, :title, :children
  attr_accessor :left, :right, :depth

  def initialize(score, title, depth = 0)
    @score = score
    @title = title
    @left = nil
    @right = nil
    @depth = depth
    @children = 0
  end

  def left_node_set(node_score, node_title)
    if left.nil?
      @left = Node.new(node_score, node_title, depth + 1)
      return @left.depth
    else
      return @left.insert(node_score, node_title)
    end
  end

  def right_node_set(node_score, node_title)
    if @right.nil?
      @right = Node.new(node_score, node_title, depth + 1)
      return @right.depth
    else
      return @right.insert(node_score, node_title)
    end
  end

  def insert(node_score, node_title)
    @children += 1
    if node_score < @score
      left_node_set(node_score, node_title)
    elsif node_score > @score
      right_node_set(node_score, node_title)
    else
      return depth
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

  def hash_maker
    {self.title => self.score}
  end
end
