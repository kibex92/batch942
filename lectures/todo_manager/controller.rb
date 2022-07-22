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
  
end