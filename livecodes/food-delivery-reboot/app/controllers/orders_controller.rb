require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/sessions_view'
require_relative '../views/customers_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    # view
    # repo
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
  end

  def list_undelivered_orders
    # 1. Get all undelivered orders from repo
    orders = @order_repository.undelivered_orders
    # 2. call display method in view
    @orders_view.display(orders)
  end

  def add
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @meals_view.ask_for_index
    meal = meals[index]

    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @customers_view.ask_for_index
    customer = customers[index]

    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    index = @sessions_view.ask_for_index
    employee = employees[index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end
end