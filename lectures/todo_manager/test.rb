require_relative 'task'
require_relative 'repository'
require_relative 'controller'
require_relative 'view'

task1 = Task.new("watch better call saul")
task2 = Task.new("watch it again")

repo = Repository.new
view = View.new

controller = Controller.new(repo, view)
controller.create
controller.create

p repo

