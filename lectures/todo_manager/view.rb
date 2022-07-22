class View
  def ask_user_for_description
    puts "What do you want to do?"
    gets.chomp
  end
  
  def display(tasks)
    tasks.each_with_index do |task, index|
      # task => Instance of `Task` class
      puts "#{index + 1}. #{task.description}"
    end
  end
end
