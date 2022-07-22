class Repository # => Responsible to handle storage of task instances
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end
  
end
