class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
    @done = attributes[:done] || false
    @prep_time = attributes[:prep_time]
  end

  def done?
    @done
  end
  
  def done!
    @done = true
  end
  
end

# Recipe.new(name: "pizza", description: "nice")
# Recipe.new(description: "nice", name: "")