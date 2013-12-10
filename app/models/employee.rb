class Employee
  TAX_RATE = 0.3

  attr_reader :first_name, :last_name
  @@employees = []

  def initialize(first_name, last_name, base_salary)
    @first_name = first_name
    @last_name = last_name
    @base_salary = base_salary
  end

  def self.employee_data(filename)
    CSV.foreach(filename, headers: true) do |row|

      first = row[0]
      last = row[1]
      salary = row[2].to_f
      position = row[3]
      bonus = row[4].to_f
      quota = row[5].to_f
      percent = row[6].to_f

      if position == 'owner'
        employee = Owner.new(first, last, salary, bonus)
      elsif position == 'commission sales'
        employee = CommissionSales.new(first, last, salary, percent)
      elsif position == 'quota sales'
        employee = QuotaSales.new(first, last, salary, bonus, quota)
      else
        employee = self.new(first, last, salary)
      end

      @@employees << employee
    end
  end

  def self.employees
    @@employees
  end

  def gross_salary
    @base_salary / 12
  end

  def net_pay
    gross_salary * (1 - TAX_RATE)
  end

  def display
    puts "Name: #{ @first_name } #{ @last_name }"
    puts "Gross Salary: $" + sprintf('%.2f', gross_salary)
    puts "Net Pay: $" + sprintf('%.2f', net_pay)
  end
end
