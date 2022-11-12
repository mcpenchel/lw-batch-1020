class OrderRepository
  def initialize(csv_file_path, meal_repo, customer_repo, employee_repo)
    @csv_file_path = csv_file_path

    @meal_repository     = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo

    @orders = []

    load_csv if File.exists?(@csv_file_path)
  end

  def mark_as_delivered!(order)
    order.deliver!

    save_csv
  end

  def create(order)
    order.id = @orders.empty? ? 1 : @orders.last.id + 1
    @orders << order

    save_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  private
  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      @orders << Order.new(
        id: row[:id].to_i,
        delivered: row[:delivered] == 'true',
        meal: @meal_repository.find(row[:meal_id].to_i),
        customer: @customer_repository.find(row[:customer_id].to_i),
        employee: @employee_repository.find(row[:employee_id].to_i)
      )
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']

      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
