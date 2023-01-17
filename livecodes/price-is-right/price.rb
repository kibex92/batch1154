# Create arr from 1 to 10
# Select 1 random element and store it in price variable
# create counter variable
# Get a number from the user -> gets.chomp
# loop until price == guess
# Gododbye message with number of attempts

arr = (1..10).to_a
p price = arr.sample
counter = 1
puts "What is your guess?"
guess = gets.chomp.to_i

until price == guess
  puts "What is your guess?"
  print "> "
  guess = gets.chomp.to_i
  counter += 1
end

puts "You took #{counter} attempts to guess #{price} correctly"


