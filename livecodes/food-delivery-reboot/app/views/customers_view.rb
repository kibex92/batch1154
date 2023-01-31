class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_user_for(input)
    puts "What's the #{input}?"
    gets.chomp
  end
end