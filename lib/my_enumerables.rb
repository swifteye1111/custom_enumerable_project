module Enumerable
  def my_each_with_index
    return unless block_given?

    i = 0
    while i < self.length
      yield self[i], i
      i += 1
    end
    self
  end
end

# Enumerable#my_select	spec/my_select_spec.rb
# Enumerable#my_all?	spec/my_all_spec.rb
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
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end
