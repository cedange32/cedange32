class TaskRepository
    attr_reader :tasks
    def initialize
      @tasks = []
    end

    def add_task(task)
      @tasks << task
    end

    def delete_task(index)
      @task.delete_at(index)
    end

    def find(index)
      @task[index]
    end
end
    # ajouter
    # supprimer
    # update --> find ()
    # lire la liste des taches
