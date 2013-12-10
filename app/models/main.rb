require 'pry'
require 'csv'

require_relative 'employee.rb'
require_relative 'owner.rb'
require_relative 'commission_sales.rb'
require_relative 'quota_sales.rb'
require_relative 'sale.rb'

Employee.employee_data('employees.csv')
employees = Employee.employees

Sale.sale_data('sales.csv')
Sale.assign_sales
sales = Sale.sales
total_sales = Sale.total_sales

puts "\n=== PAYROLL REPORT ==="
employees.each do |employee|
  puts
  employee.display
end
