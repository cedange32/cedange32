class TasksView
  def display(tasks)
    tasks.each_with_index do |task, index|
      status = task.done? ? '[x]' : '[ ]'
      puts "#{status} #{task.id} - #{task.description}"
    end
  end

  def ask_user_for_description
    puts 'What do you want to do?'
    gets.chomp
  end

  def ask_user_for_id
    puts 'Id?'
    gets.chomp.to_i
  end
end
