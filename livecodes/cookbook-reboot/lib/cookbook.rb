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

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_csv
  end 

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w(name description rating done prep)
      @recipes.each do |recipe|
        # recipe -> Is an instance of class Recipe
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # row is now a Hash
      row[:done] = row[:done] == "true"
      recipe = Recipe.new(row)
      
      @recipes << recipe
    end
  end
end