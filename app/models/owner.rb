class Owner < Employee
  COMPANY_QUOTA = 250_000

  def initialize(first_name, last_name, base_salary, monthly_bonus)
    super(first_name, last_name, base_salary)
    @monthly_bonus = monthly_bonus
  end

  def bonus
    company_sales = Sale.total_sales
    if company_sales > COMPANY_QUOTA
      @monthly_bonus
    else
      0
    end
  end

  def gross_salary
    (@base_salary / 12) + bonus
  end

  def net_pay
    super
  end

  def display
    puts "Name: #{ @first_name } #{ @last_name }"
    puts "Gross Salary: $" + sprintf('%.2f', gross_salary)
    puts "Bonus: $#" + sprintf('%.2f', bonus)
    puts "Net Pay: $" + sprintf('%.2f', net_pay)
  end
end
