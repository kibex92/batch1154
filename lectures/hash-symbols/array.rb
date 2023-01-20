# students =     [ "Peter", "Mary", "George", "Emma" ]
#                 0         1         2       3
# student_ages = [ 24     , 25    , 22      ,  20    ]

# # Peter is 24 years old. Mary is 25 years old etc.

# students.each_with_index do |student, index|
#   age = student_ages[index] # => 1st round 24, 2nd, 25 etc.
#   puts "#{student} is #{age} years old."
# end

# CRUD RECAP

# READ
students[2] # => George

# CREATE
students << "Robert"

# UPDATE
students[1] = "Mathilde"

# DESTROY
students.delete("George")