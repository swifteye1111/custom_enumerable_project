module Enumerable
  def my_each_with_index
    return unless block_given?

    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    arr = []
    for elm in self
      arr << elm if yield elm
    end
    arr
  end

  def my_all?
    my_each { |elm| return false unless yield elm }
    true
  end

  def my_any?
    my_each { |elm| return true if yield elm }
    false
  end

  def my_none?
    my_each { |elm| return false if yield elm }
    true
  end

  def my_count
    return length unless block_given?

    sum = 0
    my_each { |elm| sum += 1 if yield elm }
    sum
  end

  def my_map(&block)
    [] unless block_given?

    arr = []
    each { |elm| arr << block.call(elm) }
    arr
  end
end

# Enumerable#my_map	spec/my_map_spec.rb
# Enumerable#my_inject	spec/my_inject_spec.rb

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return unless block_given?

    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end
end
