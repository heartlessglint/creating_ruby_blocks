module Enumerable
  def my_each
    for index in 0...self.length
      yield(self[index])
    end
    self
  end

  def my_each_with_index
    for index in 0...self.length
      yield(self[index], index)
    end
    self
  end

  def my_select
    outcome = []
    my_each { |index| outcome.push(index) if yield(index) }
    outcome
  end

  def my_all
    check = true
    my_each { |index| check = false if yield(index) }
    check
  end

  def  my_any
    check = false
    my_each { |index| check = true if yield(index) }
    check
  end

  def my_none
    check = true
    my_each { |index| check = false if yield(index) }
    check
  end

  def my_count
    return self.length unless block_given?

    total = 0
    my_each { |index| total += 1 if yield(index) }
    total
  end

  def my_map
    total = 0
    my_each { |index| total = yield(index) }
  end

  def my_inject
  end 

end

test = [0, 1, 2, 3, 4, 5, 6, 7, 8, 1]

test.my_each { |n| puts n }

test.my_each_with_index { |name, index| puts "#{index}: #{name}" }

test.my_select { |n| n.odd? }

all = test.my_all { |n| n > 4 }
if not all
  puts "All false"
end

any = test.my_any { |n| n == 5 }
if any 
  puts "There was one"
end

none = test.my_none { |n| n == 2 }
if not none
  puts "At least one was found"
end

count = test.my_count
puts "The total length is #{count}"

count_num = test.my_count { |x| x == 1 }
puts "There is #{count_num} ones"

test.my_map { |x| puts x**2 }
