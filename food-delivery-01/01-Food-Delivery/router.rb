class Router
  def initialize(meals_controller, customers_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    while @running
      print_options
      user_answer = gets.chomp

      route_to(user_answer)
    end
  end

  private
  def route_to(user_answer)
    case user_answer
    when '1' then @meals_controller.add
    when '2' then @meals_controller.list
    when '3' then @customers_controller.add
    when '4' then @customers_controller.list
    when '9' then stop_running
    else
      puts 'Please enter a valid option'
    end
  end

  def stop_running
    @running = false
  end

  def print_options
    puts '#########################'
    puts '1 - Create a new meal'
    puts '2 - Lists all meals'
    puts '3 - Create a new customer'
    puts '4 - Lists all customers'
    puts '9 - Exit'
    puts '#########################'
  end
end
