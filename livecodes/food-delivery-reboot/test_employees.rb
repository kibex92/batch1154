require_relative 'app/models/employee'
require_relative 'app/repositories/employee_repository'

dion = Employee.new(username: "Dion", password: "secret", role: "manager")

employee_repo = EmployeeRepository.new("data/employee.csv")
puts "There are #{employee_repo.all.size} employees"