require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    # STATE
    # view
    # repo
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # 1. Ask user for username
    username = @view.ask_user_for("username")
    # 2. Ask user for Password
    password = @view.ask_user_for("password")
    # 3. Check if the username exists
    employee = @employee_repository.find_by_username(username) # -> Employee Instance
    # 4. Check if the password matches the employee password
    if employee && employee.password == password
      # if yes, successfull login and ???
      @view.successfull_login
      employee
    else
      @view.wrong_credentials
      sign_in
    end
      # if not display wrong credentials message
  end
end