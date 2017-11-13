require_relative "task_view"
require_relative "task"

class TaskController
	def initialize(repository)
		@repository = repository
		@view = TaskView.new 
	end

	def tasks_list 
		tasks = @repository.tasks
		@view.display_tasks(tasks)
	end

	def create_task
		name = @view.ask_for_task_name
		deadline = @view.ask_for_deadline
		task = Task.new(name, deadline)
		@repository.add_task(task)
	end

	def mark_task_as_done
		tasks_list
		index = @view.ask_for_task_index
		task = @repository.find(index)
		task.mark_as_done!
	end
end

