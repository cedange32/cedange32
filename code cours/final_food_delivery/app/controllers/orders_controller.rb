require_relative '../views/order_view'

class OrdersController
  def initialize(order_repository, customer_repository, employee_repository, meal_repository)
    @view = OrderView.new
    @order_repository = order_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @meal_repository = meal_repository
  end

  def list_undelivered_orders
    orders =@order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.my_orders(employee)
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_id = @view.ask_for('order')
    order = @order_repository.find(order_id)
    @order_repository.mark_as_delivered(order)
  end

  def add
    customers = @customer_repository.all
    @view.display_customers(customers)
    customer_id = @view.ask_for("customer")
    customer = @customer_repository.find(customer_id)

    employees = @employee_repository.delivery_guys
    @view.display_employees(employees)
    employee_id = @view.ask_for("employee")
    employee = @employee_repository.find(employee_id)

    meals = @meal_repository.all
    @view.display_meals(meals)
    meal_id = @view.ask_for("meal")
    meal = @meal_repository.find(meal_id)

    order = Order.new(customer: customer, meal: meal, employee: employee)
    @order_repository.add(order)
  end

end
