require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# # TODO: CRUD some tasks
# # READ (ONE)
# # task = Task.find(1)
# # puts "#{task.title} - #{task.description}"
# # CREATE

# task = Task.new(title: "Watch Better Call Saul!", description: "NOW!")
# task.save
# puts "The id of the new task is #{task.id}"
# # UPDATE

# # task = Task.find(1)
# task.done = true
# # task.save
# done = task.done ? "X" : " "
# puts "#{done} #{task.title}"

# # READ (ALL)
# tasks = Task.all
# tasks.each do |task|
#   puts "#{task.id} #{task.title} - #{task.description}"
# end

# # DESTROY
task = Task.find(14)
task.destroy

puts Task.find(14) == nil