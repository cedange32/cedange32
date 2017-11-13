class CustomerView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(item)
    puts "Which #{item}?"
    print ">"
    return gets.chomp
  end
end
