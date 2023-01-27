require_relative 'recipe'

class Controller
  def initialize(cookbook, view)
    @cookbook = cookbook # -> Instance of Cookbook Class
    @view = view # -> Instance of View Class
  end

  def add
    # Get user information -> name, description
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    # Create recipe instance
    recipe = Recipe.new(name, description)
    # Send recipe to cookbook
    @cookbook.create(recipe)
  end

  def list
    # Get all recipes
    recipes = @cookbook.all # -> An Array of Recipe instances
    # Send to view to display
    @view.display_list(recipes)
  end

  def remove
    # List all recipes
    list
    # Ask user for index
    index = @view.ask_user_for_index
    # Send the index to the cookbook destroy method
    @cookbook.destroy(index)
    # List all recipes
    list
  end
end