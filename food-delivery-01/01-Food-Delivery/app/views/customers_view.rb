class CustomersView
  def ask_for_name
    puts 'What\'s the customer name?'
    gets.chomp
  end

  def ask_for_address
    puts 'What\'s the address?'
    gets.chomp
  end

  def list(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} (lives at #{customer.address})"
    end
  end
end
