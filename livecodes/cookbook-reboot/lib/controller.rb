require_relative 'recipe'
require 'open-uri'
require 'nokogiri'


class Controller
  def initialize(cookbook, view)
    @cookbook = cookbook # -> Instance of Cookbook Class
    @view = view # -> Instance of View Class
  end

  def add
    # Get user information -> name, description
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    rating = @view.ask_user_for("rating")
    prep = @view.ask_user_for("Prep time?")
    # Create recipe instance
    recipe = Recipe.new(name: name, description: description, rating: rating, prep: prep)
    # Send recipe to cookbook
    @cookbook.create(recipe)
  end

  def list
    # Get all recipes
    recipes = @cookbook.all # -> An Array of Recipe instances
    # Send to view to display
    @view.display_list(recipes)
  end

  def import
    # 1. get searchterm from user
    keyword = @view.ask_user_for_searchterm
    # 2. base url
    url = "https://www.allrecipes.com/search?q=#{keyword}"
    # 3. Download the page -> URI.open
    html = URI.open(url).read
    # 4. Parse the page into a usable object -> Nokogiri
    doc = Nokogiri::HTML.parse(html)
    recipes = []
    doc.search(".mntl-card-list-items").each do |element|
      unless doc.search(".recipe-card-meta__rating-count").empty?
          recipe_url = element["href"]
          recipe_html = URI.open(recipe_url).read
          recipe_doc = Nokogiri::HTML.parse(recipe_html)

          name =  recipe_doc.search("h1").text.strip
          description  = recipe_doc.search(".article-subheading").text.strip
          rating  = recipe_doc.search(".mntl-recipe-review-bar__rating").text.strip
          if recipe_doc.search(".mntl-recipe-details__label:contains('Total Time:')").empty?
            prep = "no time given"
          else
            prep = recipe_doc.search(".mntl-recipe-details__label:contains('Total Time:') ~ .mntl-recipe-details__value").text.strip 
          end
          recipe = Recipe.new(name: name, description: description, rating: rating, prep: prep)
          recipes << recipe
      end
    end
    @view.display_list(recipes.first(5))
    # 5. Scrape for recipes
      # 5b Get back array of RECIPE INSTANCES!!!
    # 6. Display recipes to user
    # 7. Ask user for recipe index
    index = @view.ask_user_for_index
    recipe = recipes[index]
    # 8. Find recipe 
    @cookbook.create(recipe)
    # 9. Store it in the cookbook
  end

  def mark_as_done
    list
    # ask the user for index
    index = @view.ask_user_for_index
    recipes = @cookbook.all
    recipe = recipes[index]
    recipe.mark_as_done!
    list
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