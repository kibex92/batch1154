require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @view = MealsView.new
    @meal_repo = meal_repository
  end

  def list
    # 1. Get all meals from the cookbook
    meals = @meal_repo.all
    # 2. Pass meals to view
    @view.display(meals)
  end

  def add
    # 1. Ask user for name
    name = @view.ask_user_for("name")
    # 2. Ask user for price
    price = @view.ask_user_for_price
    meal = Meal.new(name: name, price: price)
    @meal_repo.create(meal)
  end
end