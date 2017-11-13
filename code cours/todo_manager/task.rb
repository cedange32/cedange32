class Task 
  attr_reader :name, :deadline
	def initialize(name, deadline)
		@name = name
		@deadline = deadline
		@done = false
	end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end

task = Task.new("Faire les courses", Time.now + 50)
