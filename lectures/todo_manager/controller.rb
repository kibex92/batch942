require_relative 'repository'
require_relative 'task'

class Controller
  def initialize(repository, view)
    @repository = repository # => Refers to the repository class and therefore giving access to all the methods inside
    @view = view # => Same like repository, its the view class 
  end

  def create
    # 1. Ask the user for the task he/she wants to create
    description = @view.ask_user_for_description
    # 2. Get the input
    # 3. Create task
    task = Task.new(description)
    # 4. Send task to repo
    @repository.add_task(task)
  end
  
  def list
    # 1. Get all tasks from repository
    tasks = @repository.all
    # 2. Pass them onto the display method of the view
    @view.display(tasks)
  end
  
  def mark_as_complete
    # 1. Display all tasks to user
    list
    # 2. Ask the user for the index of the task
    index = @view.ask_user_for_index
    # 3. Ask repo to find the task => Create `find` method
    task = @repository.find(index) # => Returns task instance of the task the user wants to mark
    # 4. mark the task as complete
    task.mark_as_complete!
  end
  
end