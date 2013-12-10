class SalesController < ApplicationController
  def index
    # make your sales objects available to the correlating view here

    sales = Sale.read_sales('db/sales.csv')
    employees = Employee.read_employees('db/employees.csv')
    @expanded_sales = sales_with_employees(sales, employees)
  end

  def sales_with_employees(sales, employees)
    expanded_sales = []
    sales.each do |sale|
      expanded_sale = { :last_name => sale.last_name, :sale_value => sale.sale_value }
      employee = sale.find_employee(employees)
      expanded_sale[:first_name] = employee.first_name
      if employee.position == 'commission sales'
        expanded_sale[:commission_due] = (employee.percent_commission * sale.sale_value / 100).round
      end
      expanded_sales << expanded_sale
    end
    expanded_sales
  end

end
