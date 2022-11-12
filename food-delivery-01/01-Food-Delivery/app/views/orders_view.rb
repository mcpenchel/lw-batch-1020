class OrdersView
  def list_meals_and_ask_for_index(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
    end

    puts 'Please choose an index:'
    gets.chomp.to_i - 1
  end

  def list_customers_and_ask_for_index(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}"
    end

    puts 'Please choose an index:'
    gets.chomp.to_i - 1
  end

  def list_employees_and_ask_for_index(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end

    puts 'Please choose an index:'
    gets.chomp.to_i - 1
  end

  def list_orders_and_ask_for_index(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} para #{order.customer.name} (#{order.customer.address})"
    end

    puts 'Please choose an index:'
    gets.chomp.to_i - 1
  end

  def list_undelivered_orders(orders)
    orders.each do |order|
      puts "#{order.meal.name} vai ser entregue por #{order.employee.username} para #{order.customer.name}"
    end
  end
end
