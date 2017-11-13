require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_controller'
require_relative 'router'
require 'sqlite3'

repository = TaskRepository.new
controller = TasksController.new(repository)
router     = Router.new(controller)

DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true

router.run
