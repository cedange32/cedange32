class CustomerView
  def display(customers)
    puts
    puts "Customers list"
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(item)
    puts
    puts "Which #{item}?"
    print ">"
    return gets.chomp
  end
end
