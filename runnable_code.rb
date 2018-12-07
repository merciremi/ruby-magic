$RUN = false

class MyClass
  puts 'I can run code in my class'

  4.times do
    puts '🙈'
  end

  def does_it_run
    puts 'It only works if $RUN is set to true.'
  end if $RUN
end

class1 = MyClass.new
p class1

# Outputs:
# I can run code in my class
# 🙈
# 🙈
# 🙈
# 🙈
# #<MyClass:0x00007fe723a3c908>

p class1.does_it_run

# Outputs:
# runnable_code.rb:17:in `<main>': undefined method `does_it_run' for #<MyClass:0x00007fe723a3c908> (NoMethodError)

$RUN = true

class2 = MyClass.new
p class2.does_it_run

# Outputs:
# runnable_code.rb:34:in `<main>': undefined method `does_it_run' for #<MyClass:0x00007fab2a14c080> (NoMethodError)

# The code within class definition is run once. Even if we change $RUN, the class def is not rerun.
