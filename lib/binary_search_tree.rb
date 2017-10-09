require_relative "node"
require "pry"
class BinarySearchTree

  attr_reader :root, :depth
  attr_accessor :all_entries
  def initialize
    @root = nil
    @depth = 0
    @all_entries = []
  end

  def insert(score, title)
    node = Node.new(score, title)
    @all_entries << node.hash_maker
    @root = node if root.nil?
    if @root == node
      return @depth
    else
    @root.insert(score, title)
    end
  end

  def include?(score_check)
    return true if score_check == @root.score
    return false if @root.nil?
    path_to_node_object(score_check)
  end

  def path_to_node_object(score_check)
    current_node = @root.find_score(score_check)
    if current_node.nil?
      false
    else
      true
    end
  end

  def depth_of(score)
    return nil if @root == nil
    return @depth if @root.score == score
    node = @root.find_score(score)
    node.depth
  end

  def value_finder
    entries = @all_entries
    scores = entries.map do |entry|
     entry.values
    end
    scores
  end

  def min
    min_value = value_finder.min
    @all_entries.find do |entry|
      entry.values == min_value
    end
  end

  def max
    max_value = value_finder.max
    @all_entries.find do |entry|
      entry.values == max_value
    end
  end

  def sort
    @all_entries.sort_by! do |entry|
      entry.values
    end
  end

  def load(filepath)
    scored_movies = File.open(filepath).readlines
    transform_file_to_inserted_nodes(scored_movies)
  end

  def transform_file_to_inserted_nodes(scored_movies)
    scored_movies.map do |line|
      score, title = line.strip!.split(", ")
      all_entries << self.insert(score.to_i, title)
      end
      delete_depths(all_entries)
  end

  def delete_depths(entries_with_depths)
    entries_with_depths.select do |movie|
      movie if movie.is_a?(Hash)
    end
  end
end
