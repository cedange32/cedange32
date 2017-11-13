require_relative 'tasks_view'

class TasksController
  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    # 1. Fetch tasks from repo
    tasks = Task.all
    # 2. Send them to view for display
    @view.display(tasks)
  end

  def create
    # 1. Get description from view
    description = @view.ask_user_for_description
    # 2. Create new task
    task = Task.new(description: description)
    # 3. Add to repo
    task.save
  end

  def mark_as_done
    # 1. Display list with indices
    list
    # 2. Ask user for index
    id = @view.ask_user_for_id
    # 3. Fetch task from repo
    task = Task.find(id)
    # 4. Mark task as done
    task.mark_as_done!
    task.save
  end
end
