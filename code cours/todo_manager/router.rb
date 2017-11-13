class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do 
      print_menu
      action = gets.chomp.to_i
      result = dispatch(action)
      break if result == "break"
    end
  end

  def dispatch(user_choice)
    if user_choice == 1
      @controller.tasks_list
    elsif user_choice == 2
      @controller.create_task
    elsif user_choice == 3
      @controller.mark_task_as_done
    elsif user_choice == 5
      return "break"
    end
  end

	def print_menu
		puts "Que voulez-vous faire ?"
		puts "1. Afficher les tâches"
		puts "2. Créer une tâches"
		puts "3. Rayer une tâche"
		puts "4. Supprimer une tâche"
		puts "5. Je me casse les gars"
    puts ""
	end
end

