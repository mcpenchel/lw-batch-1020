# frozen_string_literal: true

require_relative '../views/orders_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @order_repository    = order_repository
    @customer_repository = customer_repository
    @meal_repository     = meal_repository
    @employee_repository = employee_repository

    @view = OrdersView.new
  end

  def add
    # MEAL
    # 1. Printar para @ usuári@ todas as meals que temos, mostrando index e não id
    # 2. Pedir para @ usuário@ qual é o INDEX da meal que ele/ela quer
    # 3. Procurar no array do @meal_repository a meal daquele index que o user quis
    meals = @meal_repository.all
    meal_index = @view.list_meals_and_ask_for_index(meals)
    meal = meals[meal_index]

    customers = @customer_repository.all
    customer_index = @view.list_customers_and_ask_for_index(customers)
    customer = customers[customer_index]

    employees = @employee_repository.all_riders
    employee_index = @view.list_employees_and_ask_for_index(employees)
    employee = employees[employee_index]

    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )

    @order_repository.create(order)
  end

  # should list undelivered orders (with meal, employee assigned and customer info)
  def list_undelivered_orders
    orders = @order_repository.undelivered_orders

    @view.list_undelivered_orders(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders

    employee_orders = orders.select do |order|
      order.employee.id == employee.id
    end

    @view.list_undelivered_orders(employee_orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders

    employee_orders = orders.select do |order|
      order.employee.id == employee.id
    end

    order_index = @view.list_orders_and_ask_for_index(employee_orders)

    @order_repository.mark_as_delivered!(employee_orders[order_index])
  end
end
