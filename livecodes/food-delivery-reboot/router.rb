class Router
  # STATE
  # controllers
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end


  def run
    # SIGN IN
    while @running
      @employee = @sessions_controller.sign_in
      # 1. Display the menu
      while @employee
        display_menu
        # 2. get user action
        action = gets.chomp.to_i
        # 3. Route/Dispatch the action
        dispatch(action)
      end
    end
  end

  def display_menu
    if @employee.manager?
      display_manager_menu
    else
      display_rider_menu
    end
  end

  def display_manager_menu
    puts "------MENU-----"
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Sign out"
    puts "0 - Quit"
  end

  def display_rider_menu
    puts "------MENU-----"
    puts "1 - Mark order as delivered"
    puts "2 - List all undelivered orders"
    puts "5 - Sign out"

    puts "0 - Quit"
  end

  def dispatch(action)
    if @employee.manager?
      dispatch_manager_action(action)
    else
      dispatch_rider_action(action)
    end
  end

  def dispatch_manager_action(action)
    case action
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 3 then @customers_controller.add
      when 4 then @customers_controller.list
      when 5 then sign_out
      when 0 then stop
    else
      puts "Please enter a number from 1-5"
    end
  end

  def dispatch_rider_action(action)
    puts "TO DO"
  end

  def stop
    sign_out
    @running = false
  end

  def sign_out
    @employee = nil
  end
end