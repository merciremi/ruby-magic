# Ruby is a duck typed language: it doesn't care about the type of object as
# long as the object respond to the method call

def reverse_things(array)
  array.reverse
end

p reverse_things(%w(a b c)) # => ["c", "b", "a"]
p reverse_things('howdy')   # => "ydwoh"
p reverse_things(123456)    # => `reverse_things': undefined method `reverse' for 123456:Integer (NoMethodError)

# Array and String objects have a `.reverse` method. Integer does not
# If I want to make this work, I can open Integer and create a method `.reverse`

class Integer
  def reverse
    to_s.reverse.to_i
  end
end

p reverse_things(123456)    # => 654321

