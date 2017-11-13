class OrderView
  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} - for #{order.customer.name} by #{order.employee.username}"
    end
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}"
    end
  end

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name}"
    end
  end

  def display_employees(employees)
    employees.each do |employee|
      puts "#{employee.id} - #{employee.username}"
    end
  end

  def ask_for(item)
    puts "Which #{item} ?"
    print ">"
    gets.chomp.to_i
  end
end
