require_relative 'view'
require_relative 'recipe'
require_relative 'scraper'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    # 1. Ask the user for name/description
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    rating = @view.ask_user_for("rating")
    # 2. Create an instance
    recipe = Recipe.new(name: name, description: description, rating: rating)
    @cookbook.add_recipe(recipe)
  end
  
  
  def list
    display_recipes
  end
  
  def destroy
    # 1. Show all recipes to the user
    display_recipes
    # 2. Ask the user for the index of the recipe he/she wants to delete
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end

  def import
    # Ask user for search keyword
    keyword = @view.ask_user_for("ingredient you want to look for")
    recipes = Scraper.new(keyword).call
    # Create recipe instance for first 5 results and store in array
    # Pass online recipes to view to display
    @view.display(recipes)
    # Ask the user for index
    index = @view.ask_user_for_index
    # Find the recipe in the index
    recipe = recipes[index]
    # Pass the recipe to repo to be saved
    @cookbook.add_recipe(recipe)
  end

  def mark_recipe_as_done
    display_recipes
    index = @view.ask_user_for_index
    @cookbook.mark_as_done!(index)
  end
  
  private

  def display_recipes
    # 1.Get recipes from cookbook
    recipes = @cookbook.all
    # 2.Pass the recipes to the view
    @view.display(recipes)
  end
end