require_relative 'patient'
require_relative 'room'

clyde = Patient.new(name: "Clyde")
boris = Patient.new(name: "Boris")

beethoven = Room.new(name: "Beethoven", capacity: 2)

# puts "#{beethoven.name} room has #{beethoven.patients.size} patients. Full? #{beethoven.full?}"

beethoven.add_patient(clyde)
beethoven.add_patient(boris)

dario = Patient.new(name: "Dario")

# puts "#{beethoven.name} room has #{beethoven.patients.size} patients. Full? #{beethoven.full?}"

# begin
#   beethoven.add_patient(dario)
# rescue Exception
#   puts "Sorry, couldn't add #{dario.name} to the room. It's full"
# end
# puts "#{beethoven.name} room has #{beethoven.patients.size} patients. Full? #{beethoven.full?}"


can = Patient.new(name: "Can")

