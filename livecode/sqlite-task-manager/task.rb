class Task
  attr_reader :title, :description, :id
  attr_accessor :done
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    DB.results_as_hash = true
    query = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first

    return nil if query.nil?
    
    Task.new(id: query["id"],title: query["title"], description: query["description"], done: query["done"] == 1)
  end

  def save
    if @id.nil? 
      DB.execute("INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)", @title,@description, @done ? 1 : 0)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE tasks SET title = ?, description = ?, done = ?", @title, @description, @done ? 1 : 0)
    end
  end
  
  def self.all
    DB.execute("SELECT * FROM tasks").map { |row| Task.new(id: row["id"], description: row["description"], title: row["title"], done: row["done"] == 1)}
  end
  
  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", @id)
  end
  
end
