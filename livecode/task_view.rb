
require_relative "task"
class TaskView

def initialize
  @tasks = []
end

def display_task(task)
  tasks.each_with_index do |task, index|
    puts "#{index +1} - #{task.name} [#{task.done?}"

end
# Message d'accuueil pour la création

def creation_message
  puts 'Vous aller maintenant créer une tâche'

end

def ask_for_task_name
  puts 'Veuiller entrer un nom pour votre tache'
  gets.chomp
end

def ask_for_deadline
  puts 'Veuiller entrer une deadline'
  gets.chomp
end

def ask_for_task_index
  puts 'Quelle tache voulez vous choisir'
  gets.chomp.to_i
end

# Creer
# on va demander le nom de la tache
# on va demander la deadline

# Supprimer
# Message d'accuueil pour la suppression
# Affichage de la liste des tache
# Demander quelle tache on veut supprimer

# Afficher
# Affichage de la liste des tache

# Updater -> Passer une tache à true
# Affichage de la liste des tache
# Demander quel tache on veut adpater

end
