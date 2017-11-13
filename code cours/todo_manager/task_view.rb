class TaskView

	def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      puts "#{index + 1} - #{task.name} [#{task.done? ? "X" : " "}]"
    end
  end

  def ask_for_task_name
    puts "Veuillez entrer un nom pour votre tache"
    gets.chomp 
  end

  def ask_for_deadline
    puts "Veuillez entrer une deadline"
    gets.chomp 
  end

  def ask_for_task_index
    puts "Quelle tache voulez vous choisir"
    gets.chomp.to_i - 1
  end
end