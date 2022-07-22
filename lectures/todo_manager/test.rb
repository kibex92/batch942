require_relative 'task'
require_relative 'repository'
require_relative 'controller'
require_relative 'view'


repo = Repository.new
view = View.new

controller = Controller.new(repo, view)
controller.create
controller.create

controller.list

