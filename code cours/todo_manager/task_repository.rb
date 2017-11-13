require_relative "task"

class TaskRepository
	attr_reader :tasks

	def initialize
		@tasks = []
	end

	def add_task(task)
		@tasks << task
	end

	def delete_task(index)
		@tasks.delete_at(index)
	end
	
	def find(index)
		@tasks[index]
	end
end

