require_relative 'task'

class TasksController
  
  # STATE
  # Repository
  # View
  def initialize(repo, view)
    @repo = repo # -> Instance of TaskRepository
    @view = view # -> Instance of TasksView
  end

  # BEHAVIOUR -> User Stories

  def add
    # 1. Ask the user for the task -> View
    description = @view.ask_user_for_description
    # 2. CREATE INSTANCE OF A TASK CLASS WITH THE USER INPUT!!!!!
    task = Task.new(description)
    # 3. Send the task instance to the repo to be saved
    @repo.create(task)
  end

  def list
    # 1. Get all Tasks
    tasks = @repo.all
    # 2. Pass tasks to view to be displayed
    @view.display(tasks)
  end

  def mark_as_done
    list
    index = @view.ask_user_for_index
    task = @repo.find(index) # -> The task instance the user wants to modify
    task.done!
    list
  end
end