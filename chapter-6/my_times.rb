class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
end


# Exercise 1 - subsection 3
#   as my_each requires an array i first created one, thogh
#   this provides extra work to the method
# ------------------------
class Integer
  def my_times
    acc = []
    x = 0
    until x == self
      acc << x
      x += 1
    end

    acc.my_each { |i| yield i }
    self
  end
end
# ------------------------


5.my_times {|i| puts "I'm on iteration #{i}!" }

