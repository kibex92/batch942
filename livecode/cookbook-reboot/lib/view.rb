class View
  def ask_user_for(stuff)
    puts "What is the #{stuff}"
    gets.chomp
  end
  
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}  - #{recipe.description}"
    end
  end

  def ask_user_for_index
    puts "What is the number?"
    gets.chomp.to_i - 1
  end
  
end