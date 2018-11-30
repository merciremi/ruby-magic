# Ruby allows us to open existing Classes and add stuff to them
class Array
  # Implement my own .map method: simple version
  def my_map
    results = []
    # Self refers to the array to which we apply .my_map
    # Yield takes the block parameter `integer` as an argument
    self.each { |integer| result << yield(integer) }
    results
  end
end

# .map will return a new array with each integer multiply by two
p [1, 2, 3].map { |integer| integer * 2 }
# .my_map should return the same
p [1, 2, 3].my_map { |integer| integer * 2 }
