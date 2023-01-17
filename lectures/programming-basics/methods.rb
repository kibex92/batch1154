require 'date'

def greetings(name)
  name = name.capitalize
  "Hi, #{name}"
end

boris = "Boris"
alex = "Alex"
theresia = "Theresia"

puts greetings(boris)
puts greetings(alex)
puts greetings(theresia)

# def greetings2
#   return "Hey everyone"
# end

# puts greetings2

# def tomorrow
#   tomorrow_date = Date.today + 1
#   return tomorrow_date.strftime("%B %d")
# end

# puts tomorrow

# def area(radius)
#   return 0 if radius.negative?

#   3.14 * radius ** 2

# end