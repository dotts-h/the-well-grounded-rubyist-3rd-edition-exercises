class Ticket
  attr_accessor :venue, :date, :name

  def initialize(name, venue, date)
    self.name = name
    self.venue = venue
    self.date = date
  end

  # Exercise 1 - subsection 1
  # -------------------------
  def ===(other_ticket)
    self.date == other_ticket.date
  end
  # -------------------------
end

# Exercise 2 - subsection 1
#   this most probably works with an unknown number of arguments
#   and then parsing the array with an if conditional, but since
#   arrays have not been presented in detail yet and the exercise
#   specifically asks just to move the case block
# -------------------------
class TicketComparer
  def self.compare(ticket1, ticket2, ticket3)
    case ticket1
    when ticket2
      puts "Same date as ticket2!"
    when ticket3
      puts "Same date as ticket3!"
    else
      puts "No match."
    end
  end
end
 # -------------------------


ticket1 = Ticket.new("ticket1","Town Hall", "07/08/18")
ticket2 = Ticket.new("ticket2","Conference Center", "07/08/18")
ticket3 = Ticket.new("ticket3","Town Hall", "08/09/18")

puts "#{ticket1.name} is for an event on: #{ticket1.date}."
TicketComparer.compare(ticket1, ticket2, ticket3)
