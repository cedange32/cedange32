class Task
  Attr_reader :name :deadline
  def initialize(name, deadline)
    @name = name
    @deadline = deadline
    @done = done
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end

Task = Task.new("Faire les cours", Time.now + 50)
