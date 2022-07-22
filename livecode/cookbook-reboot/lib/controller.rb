require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    # 1. Ask the user for name/description
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    # 2. Create an instance
    recipe = Recipe.new(name, description)
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

  private

  def display_recipes
    # 1.Get recipes from cookbook
    recipes = @cookbook.all
    # 2.Pass the recipes to the view
    @view.display(recipes)
  end
end