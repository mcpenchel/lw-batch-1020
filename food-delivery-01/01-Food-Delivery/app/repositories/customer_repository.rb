class CustomerRepository

  # It reads and writes the meals from the CSV file and holds them as objects in an array.
  def initialize(csv_file_path)
    @customers = []
    @csv_file_path = csv_file_path
    load_csv if File.exists?(@csv_file_path)
  end

  # create a new meal]
  def create(customer)
    # if @customers.empty?
    #   customer.id = 1
    # else
    #   customer.id = @customers.last.id + 1
    # end

    # variavel = condition ? value_if_true : value_if_false
    customer.id = @customers.empty? ? 1 : @customers.last.id + 1

    @customers << customer
    save_csv
  end

  # Get all the customers
  def all
    @customers
  end

  # find a specific customer thanks to its id
  def find(customer_id)
    @customers.find do |customer|
      customer.id == customer_id
    end
  end

  private
  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ['id', 'name', 'address']
      # devo eu colocar isso dentro ou fora do loop?
      # resposta: esse comando deve ser executado + de uma vez?
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id]    = row[:id].to_i

      @customers << Customer.new(row)
    end
  end
end
