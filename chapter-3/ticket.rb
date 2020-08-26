class Ticket

  def initialize(venue)
    @venue = venue
  end

  def venue
    @venue
  end

  def date
    @date
  end

  # Exercise 2 - subsection 3
  # -------------------------
  def date=(date)
    year, month, day = date.split("-")
    if (year.to_i > 1900 &&
        month.to_i < 13 &&
        month.to_i > 0 &&
        day.to_i < 32 &&
        day.to_i > 0)
      @date = date
    else
      puts "Please submit the date in the format 'yyyy-mm-dd'."
    end
  end      
  # -------------------------

  def price
    @price
  end
  def price=(amount)
    if (amount * 100).to_i == amount * 100
      @price = amount
    else
      puts "The price seems to be malformed"
    end
  end
  
  # Exercise 1 - subsection 3
  # -------------------------
  def discount(percent)
    @price = @price * (100 - percent) / 100
  end
  # -------------------------

end


th = Ticket.new("Town Hall") 
th.price = 100.00

puts "The ticket for #{th.venue} has been discounted 15% to #{th.discount(15)}."

ticket = Ticket.new("Town Hall")
ticket.date = "2013-11-12"
puts ticket.date

ticket.date = "13-11-12"
puts ticket.date
