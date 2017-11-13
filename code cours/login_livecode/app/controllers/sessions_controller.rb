require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionView.new
    @employee_repository = employee_repository
  end

  def sign_in
    #ask for username
    username = @view.ask_for('username')
    #ask for password
    password = @view.ask_for('password')
    #check if username exist => EmployeeRepository
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      return employee
    else
      @view.wrong_credentials
    #   ask to sign_in again
      sign_in # recursivity
    end
  end
end
