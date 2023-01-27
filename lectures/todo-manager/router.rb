class Router
  # STATE
  # controller
  def initialize(controller)
    @controller = controller
  end

  # BEHAVIOUR
  # route user input to controller

  def run
    loop do
      show_menu
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  def show_menu
    puts "Welcome to our TODO-Manager"
    puts "1 - Add a task"
    puts "2 - List all your tasks"
    puts "3 - Mark a task as done"
  end

  def  dispatch(action)
    case action
    when 1 then @controller.add
    when 2 then @controller.list
    when 3 then @controller.mark_as_done
    else
      puts "Oops, wrong input"
    end
  end
end