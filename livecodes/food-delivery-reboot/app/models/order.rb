class Order
  attr_accessor :id, :employee, :customer, :meal

  def initialize(attr = {})
    # STATE
    # id
    @id = attr[:id]
    @meal = attr[:meal]
    @employee = attr[:employee]
    @delivered = attr[:delivered] || false
    @customer = attr[:customer]
    # meal -> Meal Instance
    # customer -> Customer Instance
    # employee -> Employee Instance
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end