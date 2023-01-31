class Router
  # STATE
  # controllers
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end


  def run
    while @running
      # 1. Display the menu
      display_menu
      # 2. get user action
      action = gets.chomp.to_i
      # 3. Route/Dispatch the action
      dispatch(action)
    end
  end

  def display_menu
    puts "------MENU-----"
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Quit"
  end

  def dispatch(action)
    case action
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 3 then @customers_controller.add
      when 4 then @customers_controller.list
      when 5 then stop
    else
      puts "Please enter a number from 1-5"
    end
  end

  def stop
    @running = false
  end
end