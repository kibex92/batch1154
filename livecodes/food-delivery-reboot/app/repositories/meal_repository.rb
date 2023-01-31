require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    # STATE
    #  - meals
    # - csv_file
    # - next_id
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  def create(meal)
    # 1. Set the id to the meal
    meal.id = @next_id
    # 2. Increment @next_id
    @next_id += 1
    # 3. Push into meals
    @meals << meal
    # 4. Save to CSV
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private
  
  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meal = Meal.new(row)
      @meals << meal
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w(id name price)
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end