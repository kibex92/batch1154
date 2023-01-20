

# CRUD

# READ
# munich["monument"] # => Frauenkirche
# munich["shmeckels"] # => Nil

# CREATE
# munich["state"] = "Bavaria"

# # UPDATE
# munich["population"] = 1500001
# munich["population"] += 5

# # DELETE
# munich.delete("state")
# p munich

# Read the previous mayor of Munich
# munich = {
#   "country" => "Germany",
#   "monument" => "Frauenkirche",
#   "population" => 1500000,
#   "mayor" => {
#     "current" => "Reiter",
#     "prev" => "Ude"
#   }
# }

# p munich["mayor"]["prev"]
#         # Hash     # String
# munich.each do |key,value|
#   puts "Munich's #{key} is #{value}"
# end

# munich.key?("state") => false
# munich.keys # => ["country", "monument", "population"]
# munich.values # => ["Germany", "Frauenkirche", 1500000, {"current"=>"Reiter", "prev"=>"Ude"}]
# p munich.values[-1]["current"] # => Reiter
# #     Hash   # String 

# munich = {
#   country: "Germany",
#   monument: "Frauenkirche",
#   population: 1500000,
# }

# p munich["country"]
# p munich[:country]

def tag(tag_name,  content, attrs = {} )
  attributes = attrs.map { |key, value| "#{key}='#{value}'" }.join(" ")
  "<#{tag_name} #{attributes}>#{content}</#{tag_name}>"
end
# puts tag("h1", "Hello world")
# <h1>Hello world</h1>
puts tag("a", "Le Wagon", {href: "http://lewagon.org", class: "btn", id: "logo"} )
# <a href='http://lewagon.org' class='btn'>Le Wagon</a>