class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    action = 1
    until action == 0
      puts "What do you want to do?"
      puts "1-List all meals"
      puts "2-Add a meal"
      puts "3-List customers"
      puts "4-Add customer"
      puts "0-Exit"
      print "> "
      action = gets.chomp.to_i

      case action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.add
      when 3 then @customers_controller.list
      when 4 then @customers_controller.add
      else
        action = 0
      end
    end
  end
end
