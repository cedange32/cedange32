class Router
    # run
    # print_menu
    # dispatch

    def initialize (controller)
      @controller = controller
    end

    def run
      loop do
        print_menu
        action = gets.chomp.to_i
        dispatch(action)
        break
      end
    end

    def dispatch(user_choice)
      if user_choice == 1
        @controller.tasks_list
      elsif user_choice == 2
        @controller.create_task
      elsif ser_choice == 3

      end

    end

    def print_menu
      puts "Que voulez-vous faire?"
      puts "1. Afficher les taches"
      puts "2. Creer une tâche"
      puts "3. Rayer une tâche"
      puts "4. Supprimerune tâche"
      puts "5. Je me casse les gars"

require_relative "task_repository"
require_relative "task_controller"
require_relative "router"

repository = TaskRepository.new
controller = Controller.new(repository)
router = Router.new(controller)
router.run
end
