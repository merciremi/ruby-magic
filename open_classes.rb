# Classes can be opened and modified

class String
  def says_foo
    'foo'
  end
end

p "bob".says_foo

class Array
  # Standards methods can be rewritten too
  def map
    raise "Can't map your array buddy"
  end
end

p %w(1 2 3).map
