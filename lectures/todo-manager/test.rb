require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_view'
require_relative 'tasks_controller'
require_relative 'router'

repo = TaskRepository.new
view = TasksView.new
controller = TasksController.new(repo, view)
router = Router.new(controller)

router.run