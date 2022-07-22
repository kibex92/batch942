class View
  def ask_user_for_description
    puts "What do you want to do?"
    gets.chomp
  end
  
  def display(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? "X" : " "
      # task => Instance of `Task` class
      puts "#{index + 1}. [#{done}]#{task.description}"
    end
  end
  
  def ask_user_for_index
    puts "What is the number?"
    gets.chomp.to_i - 1
  end
  
end
