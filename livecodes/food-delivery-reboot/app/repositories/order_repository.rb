require 'csv'
require 'pry'
require_relative '../models/order'

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @csv_file = orders_csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id = 1
    @orders = []
    load_csv if File.exist?(orders_csv_path)
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def create(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      row[:delivered] = row[:delivered] == "true"
      order = Order.new(row)
      order.employee = employee
      employee.add_order(order) # -> Add Order to the orders array of the Employee
      @orders << order
      # ALTERNATIVE
      # meal = @meal_repository.find(row[:meal_id].to_i)
      # employee = @employee_repository.find(row[:employee_id].to_i)
      # customer = @customer_repository.find(row[:customer_id].to_i)
      # order = Order.new
      # order.meal = meal
      # order.employee = employee
      # order.customer = customer
      # @orders << order
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end
end
