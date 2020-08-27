class Car
  # Book code
  # ---------
=begin
  @@makes = []
  @@cars = {}

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @@cars[self.make]
  end
=end
  # ---------

  attr_reader :make

  class << self
    
    def total_count
      @total_count ||= 0
    end

    def total_count=(n)
      @total_count = n
    end

    def cars
      @cars ||= {}
    end

    def cars=(cars)
      @cars = cars
    end

    def add_to_cars(make, n = 1)
      @cars[make] += n
    end

    def makes
      @makes ||= []
    end

    def makes=(makes)
      @makes = makes
    end

    def add_make(make)
      unless makes.include?(make)
        makes << make
        cars[make] = 0
      end
    end
  end

  def initialize(make)
    if self.class.makes.include?(make)
      puts "Creating new #{make}!"
      @make = make
      self.class.add_to_cars(make)
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    self.class.cars[self.make]
  end

end

Car.add_make("Honda")
Car.add_make("Ford")
h = Car.new("Honda")
f = Car.new("Ford")
h2 = Car.new("Honda")

puts "Counting cars of same make as h2..."
puts "There are #{h2.make_mates}."

puts "Counting total cars..."
puts "There are #{Car.total_count}."


class Hybrid < Car
  def initialize(make)
    # Needed these 2 lines to be able to use the info from class Car
    #   inside the Hybrid class
    self.class.makes = Car.makes
    self.class.cars = Car.cars
    super
  end
end

h3 = Hybrid.new("Honda")
f2 = Hybrid.new("Ford")

puts "There are #{Hybrid.total_count} hybrids on the road!"
