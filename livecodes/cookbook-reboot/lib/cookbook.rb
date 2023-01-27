require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def all
    @recipes
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|
        # recipe -> Is an instance of class Recipe
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end
end