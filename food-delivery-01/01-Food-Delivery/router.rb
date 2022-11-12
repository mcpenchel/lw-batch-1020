class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    employee = @sessions_controller.sign_in

    while @running
      if employee.role == 'manager'
        print_manager_options
        user_answer = gets.chomp

        route_manager_to(user_answer)
      else
        print_rider_options
        user_answer = gets.chomp

        route_rider_to(user_answer)
      end
    end
  end

  private
  def route_manager_to(user_answer)
    case user_answer
    when '1' then @meals_controller.add
    when '2' then @meals_controller.list
    when '3' then @customers_controller.add
    when '4' then @customers_controller.list
    when '5' then puts 'TO-DO: Create a new order'
    when '6' then puts 'TO-DO: List all undelivered orders'
    when '9' then stop_running
    else
      puts 'Please enter a valid option'
    end
  end

  def route_rider_to(user_answer)
    case user_answer
    when '1' then puts 'TO-DO: Mark an order as delivered'
    when '2' then puts 'TO-DO: List my undelivered orders'
    when '9' then stop_running
    else
      puts 'Please enter a valid option'
    end
  end

  def stop_running
    @running = false
  end

  def print_manager_options
    puts '#########################'
    puts '1 - Create a new meal'
    puts '2 - Lists all meals'
    puts '3 - Create a new customer'
    puts '4 - Lists all customers'
    puts '5 - Create a new order'
    puts '6 - List all undelivered orders'
    puts '9 - Exit'
    puts '#########################'
  end

  def print_rider_options
    puts '#########################'
    puts '1 - Mark an order as delivered'
    puts '2 - List my undelivered orders'
    puts '9 - Exit'
    puts '#########################'
  end
end

# [X] As a manager, I can add a new meal
# [X] As a manager, I can list all the meals
# [X] As a manager, I can add a new customer
# [X] As a manager, I can list all the customers
# [ ] As a manager, I can add a new order
# [ ] As a manager, I can list all the undelivered orders
# [ ] As a rider, I can mark one of my orders as delivered
# [ ] As a rider, I list all my undelivered orders
