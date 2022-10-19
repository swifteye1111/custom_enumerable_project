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
end

# Enumerable#my_any?	spec/my_any_spec.rb
# Enumerable#my_none?	spec/my_none_spec.rb
# Enumerable#my_count	spec/my_count_spec.rb
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
