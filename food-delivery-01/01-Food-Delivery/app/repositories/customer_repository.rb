class CustomerRepository

  # It reads and writes the meals from the CSV file and holds them as objects in an array.
  def initialize(csv_file_path)
    @customers = []
    @csv_file_path = csv_file_path
    load_csv if File.exists?(@csv_file_path)
  end

  def create(customer)
    customer.id = @customers.empty? ? 1 : @customers.last.id + 1

    @customers << customer
    save_csv
  end

  def all
    @customers
  end

  def find(customer_id)
    @customers.find do |customer|
      customer.id == customer_id
    end
  end

  private
  # Esse repositório tem ESCRITA
  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  # Esse repositório tem LEITURA
  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i

      @customers << Customer.new(row)
    end
  end
end
