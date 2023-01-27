class TaskRepository
  # STATE
  # tasks
  def initialize
    @tasks = []
  end

  # BEHAVIOUR
  def create(task)
    @tasks << task
  end

  def find(index)
    @tasks[index]
  end

  def all
    @tasks
  end

  def destroy(index)
    @tasks.delete_at(index)
  end
end