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

  def mark_as_done!(index)
    recipe = @recipes[index]
    recipe.done!
    write_csv
  end
  
  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      # row => {name: "pizza", description: "nice", rating: "4", done: "true"}
      row[:done] = row[:done] == "true"
      recipe = Recipe.new(row)
      @recipes << recipe
    end
  end
  
  def write_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["name", "description", "rating", "done", "prep_time"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep_time]
      end
    end
  end
end

