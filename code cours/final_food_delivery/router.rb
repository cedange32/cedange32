class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    puts '********************************************'
    puts '             Welcome'
    puts '********************************************'
    @employee = @sessions_controller.sign_in
    role = @employee.role
    while @employee
      if role == 'manager'
        menu_for_manager
      else
        menu_for_delivery_guy
      end
    end
  end

  def menu_for_manager
    puts
    puts "What do you want to do?"
    puts "1-List all meals"
    puts "2-Add a meal"
    puts "3-List customers"
    puts "4-Add customer"
    puts "5-List undelivered orders"
    puts "6-Add an order"
    puts "0-Exit"
    print "> "
    action = gets.chomp.to_i

    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 0 then @employee = nil
    else
      puts
      puts 'this action does not exist, try anothe one'
    end
  end

  def menu_for_delivery_guy
    puts "What do you want to do?"
    puts "1-List my undelivered orders"
    puts "2-Mark an order as delivered"
    puts "0-Exit"
    print "> "
    action = gets.chomp.to_i

    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 0 then @employee = nil
    else
      puts
      puts 'this action does not exist, try anothe one'
    end
  end
end
