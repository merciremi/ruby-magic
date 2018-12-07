# Classes are objects

MyClass = Class.new

# MyClass is an instance of Class class
MyClass.name                      # => "MyClass"
MyClass.class                     # => Class

# my_class1 stores an instance of MyClass class
my_class = MyClass.new
my_class.name                     # => nil
my_class.class                    # => "MyClass"

# Store an instance of Class in a local variable
my_other_class = Class.new
my_other_class.name               # => nil because my_other_class is a variable not a constant
my_other_class.class              # => Class because my_other_class stores an instance of Class

# I can then assign a constant to the Class instance stored in my_other_class
MyOtherClass = my_other_class
my_other_class.name               # => "MyOtherClass"
my_other_class.class              # => MyOtherClass

# It is now possible to call `.new` on the Class instance initially stored in `my_other_class`
instance_of_my_other_class = MyOtherClass.new
instance_of_my_other_class.class  # => "MyOtherClass"

# Class is a class
Class.class                       # => Class
Class.instance_of? Class          # => true Class is an instance of itself (it's recursive)

# Accessing sigleton class (or eigenclass)
class MyClass
  def initialize
    @greeting = "Hello, I'm an instance variable"
  end

  def greeting
    @greeting
    # Can access instance variable @greeting
    # Can't access class instance variable @goodbye
  end

  def self.set_goodbye
    # Can define class instance variable @goodbye
    # Can't access instance variable @greeting
    @goodbye = "I'm a class instance variable saying goodbye to you!"
  end

  # def self.method_name can also be written like this:
  class << self
    def say_goodbye
      # Can access class instance variable @goodbye
      # Can't access instance variable @greeting
      puts @goodbye               # => "I'm a class instance variable saying goodbye to you!"
      puts @greeting              # => nil
    end
  end
end

my_class2 = MyClass.new

my_class2.greeting                # => "Hello, I'm an instance variable"
my_class2.say_goodbye             # => undefined method `say_goodbye' for #<MyClass:0x00007feb7090b038> (NoMethodError)

MyClass.greeting                  # => undefined method `greeting' for MyClass:Class (NoMethodError)
MyClass.set_goodbye               # => "I'm a class instance variable saying goodbye to you!"
