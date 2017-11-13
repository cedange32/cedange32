require_relative '../models/order'
require 'csv'
class OrderRepository
  def initialize(csv_file_path, customer_repo, employee_repo, meal_repo)
    @csv_file_path = csv_file_path
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @meal_repo = meal_repo
    @orders = []
    load_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def add(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def my_orders(employee)
    undelivered_orders.select { |order| order.employee == employee}
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:delivered] = row[:delivered] == 'true'
      row[:customer] = @customer_repo.find(row[:customer_id].to_i)
      row[:employee] = @employee_repo.find(row[:employee_id].to_i)
      row[:meal] = @meal_repo.find(row[:meal_id].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end


   def save_csv
    CSV.open(@csv_file_path,'wb') do |csv|
      csv << %w[id delivered customer_id employee_id meal_id]
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.customer.id, order.employee.id, order.meal.id]
      end
    end
  end
end
