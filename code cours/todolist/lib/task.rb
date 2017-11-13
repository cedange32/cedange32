class Task
  attr_reader :description, :id

  def initialize(attributes = {})
    @id = attributes['id'] || attributes[:id]
    @description = attributes['description'] || attributes[:description]
    @done = attributes['done'] == 1 || attributes[:done] == 1
  end

  def self.all
    response = DB.execute("SELECT * FROM tasks")
    response.map { |hash| Task.new(hash) }
  end

  def self.find(id)
    response = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
    Task.new(response)
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO tasks (description, done) VALUES (?, ?)",
        @description,
        @done ? 1 : 0
      )
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE tasks SET description = ?, done = ? WHERE id = ?",
        @description,
        @done ? 1 : 0,
        @id
      )
    end
  end


  def mark_as_done!
    @done = true
  end

  def done?
    @done
  end
end
