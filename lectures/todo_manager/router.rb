class Router
  def initialize(controller)
    @controller = controller
  end
  
  def run
    loop do
      puts "What do you want to do?"
      puts "1 - Add a task"  
      puts "2 - Display all tasks"  
      puts "3 - Mark a task as complete"  

      action = gets.chomp.to_i

      case action
      when 1 then @controller.create
      when 2 then @controller.list
      when 3 then @controller.mark_as_complete
      else
        puts "Wrong input"
      end
    end
  end
end