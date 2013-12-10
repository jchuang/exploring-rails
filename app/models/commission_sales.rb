class CommissionSales < Employee
  def initialize(first_name, last_name, base_salary, percent_commission)
    super(first_name, last_name, base_salary)
    @percent_commission = percent_commission
    @monthly_sales = 0
  end

  def add_sale(sale) # Takes a Sale object and credits it to this employee.
    @monthly_sales += sale.sale_value
  end

  def commission
    @monthly_sales * @percent_commission / 100
  end

  def gross_salary
    (@base_salary / 12) + commission
  end

  def net_pay
    super
  end

  def display
    puts "Name: #{ @first_name } #{ @last_name }"
    puts "Gross Salary: $" + sprintf('%.2f', gross_salary)
    puts "Commission: $" + sprintf('%.2f', commission)
    puts "Net Pay: $" + sprintf('%.2f', net_pay)
  end
end
