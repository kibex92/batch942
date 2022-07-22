require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    load_csv
  end

  # CRUD
  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end
  
  def all
    @recipes
  end
  
  def remove_recipe(index)
    @recipes.delete_at(index)
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path) do |row|
      # row => ["pizza", "super nice"]
      # row[0] => "pizza"
      # row[1] => "super nice"
      name = row[0]
      description = row[1]
              # name description
      recipe = Recipe.new(name, description)
      @recipes << recipe
    end
  end
  
  def write_csv
    CSV.open(@csv_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end

