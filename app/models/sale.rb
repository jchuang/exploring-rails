require 'csv'

class Sale
  attr_reader :last_name, :sale_value
  @@sales = []

  def initialize(last_name, sale_value)
    @last_name = last_name
    @sale_value = sale_value
  end

  def self.read_sales(filename)
    @@sales = []
    CSV.foreach(filename, headers: true) do |row|
      sale = self.new(row[0], row[1].to_i)
      @@sales << sale
    end
    @@sales
  end

  def find_employee(employees)
    employees.find { |employee| employee.last_name == @last_name }
  end

  # Credit each Sale object to the appropriate employee.
  # def self.assign_sales
  #   employees = Employee.employees
  #   @@sales.each do |sale|
  #     salesperson = employees.find { |employee| employee.last_name == sale.last_name}
  #     salesperson.add_sale(sale)
  #   end
  # end

  def self.total_sales
    company_sales = 0
    @@sales.each { |sale| company_sales += sale.sale_value }
    company_sales
  end

end
