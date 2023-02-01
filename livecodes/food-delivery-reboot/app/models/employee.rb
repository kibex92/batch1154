class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attr = {})
    # STATE
    # id
    # username
    # password
    # role
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
    # Define an empty array of orders where we will store all orders associated to one rider
    @orders = []
  end

  def add_order(order)
    # Add an order to employees order array and set the employee of the order
    # to the instance of Employee calling the method
    @orders << order
    order.employee = self
  end

  def undelivered_orders
    # Reject orders of employee that are delivered and return only array of undelivered Orders
    @orders.reject { |order| order.delivered? }
  end

  # BEHAVIOUR
  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end
end
