require_relative "app/repositories/meal_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/order_repository"

meal_repo = MealRepository.new("data/meals.csv")
employee_repo = EmployeeRepository.new("data/employees.csv")
customer_repo = CustomerRepository.new("data/customers.csv")
order_repo = OrderRepository.new("data/orders.csv", meal_repo, employee_repo, customer_repo)

p order_repo