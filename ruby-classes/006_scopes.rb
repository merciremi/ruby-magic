# Scope: a virtual environment where variables and methods live
# In the scope: you can access them
# Out of scope: you can't access them

# Access current scope pseudo variable self
self                      # main

class Foo
  self                    # Foo
end

# Ruby set the value of self based on current scope
# Instance variables and methods without explicit receiver are called on current scope

class MyClass
  self                    # Object MyClass

  def greeting
    self                  # Current scope is instance of Object MyClass
    hello                 # Calling hello() without explicit receiver => this reads as self.hello()
  end

  def hello
    @hello ||= "Hello"    # Instance variable is searched in self (instance of Object MyClass)
  end
end

my_class = MyClass.new
my_class                  # #<MyClass:0x00007ffb510f3620>
my_class.greeting         # Calling greeting() on explicit reveiver my_class
p MyClass.hello           # undefined method `hello' for MyClass:Class (NoMethodError) => hello() is an instance method so when called on a Class, it doesn't have the right scope

# Only three keywords can change scope

# class
# module
# def

puts self                     # main (Object class)

class NewClass
  puts self                   # NewClass class

  def instance_method
    puts self                 # Def changes scope of self from NewClass to instance of NewClass
  end
end

obj1 = NewClass.new           # #<NewClass:0x00007ffb510f32d8>
obj2 = NewClass.new           # #<NewClass:0x00007ffb510f31e8>

obj1.instance_method          # #<NewClass:0x00007ffb510f32d8>
obj2.instance_method          # #<NewClass:0x00007ffb510f31e8>

# Top level scope: instance of Object class, always named 'main'
# Within class definition: scope changes to NewClass class
# In def block: scope changes to the current instance of NewClass

# Values of self and eigenclass

class AnotherClass
  class << self
    puts self                 # #<Class:AnotherClass> => we are in AnotherClass eigenclass (AnotherClass is an instance of Class. It's unique so, it's a singleton class.)

    def class_method
      puts self
    end
  end
end

AnotherClass.class_method     # AnotherClass => Scope changed in method definition

# Top level scope: instance of Object class, always named 'main'
# Within class definition: scope changes to NewClass class
# Within def block: scope changes to the current instance of NewClass
# Within class << ClassName: eigenclass scope
# Within class methods: scope changes to NewClass class



