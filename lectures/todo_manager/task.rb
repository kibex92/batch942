class Task
  attr_reader :description

  def initialize(description)
    @description = description
    @done = false
  end
end
