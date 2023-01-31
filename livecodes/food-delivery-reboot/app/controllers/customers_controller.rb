require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @view = CustomersView.new
    @customer_repo = customer_repository
  end

  def list
    # 1. Get all meals from the cookbook
    customers = @customer_repo.all
    # 2. Pass customers to view
    @view.display(customers)
  end

  def add
    # 1. Ask user for name
    name = @view.ask_user_for("name")
    # 2. Ask user for price
    address = @view.ask_user_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repo.create(customer)
  end
end