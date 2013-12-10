class EmployeesController < ApplicationController
  def index
    # make your employee objects available to the correlating view here

    @employees = Employee.read_employees('db/employees.csv')
  end
end
