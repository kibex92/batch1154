require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    # STATE
    #  - employee
    # - csv_file
    # - next_id
    @csv_file = csv_file
    @employees = []
    load_csv if File.exist?(csv_file)
  end

  def all
    @employees
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username.downcase }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      employee = Employee.new(row)
      @employees << employee
    end
  end
end