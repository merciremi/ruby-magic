# Everything is an object

# Object (main)
p self                  # => main
p self.class            # => Object

# Array
p %w(a b c).class       # => Array

# String
p 'Hello'.class         # => String

# Boolean
p true.class            # => TrueClass
p false.class           # => FalseClass

# Custom classes
class MyClass
end
p MyClass.new.class     # => MyClass

# Structs
Bob = Struct.new(:age)
p Bob.new(34).class     # => Bob

# Objects inheritance:
p Object.ancestors      # => [Object, Kernel, BasicObject]
# BasicObject > Kernel > Object > All other Ruby objects

# Kernel is a mixed-in module with basics public/private methods
p Kernel.class          # => Module
p Kernel.public_methods.include? :puts # => true
# Or to write it differently:
p method(:puts).owner   # => Kernel
