require 'csv'
require_relative '../models/employee.rb'

class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @employees = []
    load_csv
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def delivery_guys
    @employees.select do |employee|
      employee.role == "delivery_guy"
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id]    = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end
end

# repo = EmployeeRepository.new('data/employees.csv')
# p repo.find_by_username('bob')
