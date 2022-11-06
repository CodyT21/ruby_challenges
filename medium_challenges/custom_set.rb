require 'pry-byebug'

class CustomSet
  attr_accessor :set

  def initialize(set = [])
    @set = remove_duplicates(set)
  end

  def empty?
    set.empty?
  end 

  def contains?(num)
    set.include?(num)
  end

  def subset?(other_set)
    set.all? { |num| other_set.contains?(num) }
  end

  def disjoint?(other_set)
    set.all? { |num| !other_set.contains?(num) }
  end

  def eql?(other_set)
    set.sort == other_set.set.sort
  end
  # alias_method :==, :eql?
  def ==(other_set)
    eql?(other_set)
  end

  def add(num)
    set << num unless contains?(num)
    self
  end

  def intersection(other_set)
    shared_values = []
    set.each { |num| shared_values << num if other_set.contains?(num) }
    self.class.new(shared_values)
  end

  def difference(other_set)
    different_values = []
    set.each { |num| different_values << num unless other_set.contains?(num) }
    self.class.new(different_values)
  end

  def union(other_set)
    union = set + other_set.set
    self.class.new(union)
  end

  private

  def remove_duplicates(set)
    trimmed_set = []
    set.each do |num|
      trimmed_set << num unless trimmed_set.include?(num)
    end
    trimmed_set
  end
end