require 'csv'

class Employee
  TAX_RATE = 0.3

  attr_reader :first_name, :last_name, :position

  def initialize(first_name, last_name, position, base_salary)
    @first_name = first_name
    @last_name = last_name
    @position = position
    @base_salary = base_salary
  end

  def self.read_employees(filename)
    employees = []
    CSV.foreach(filename, headers: true) do |row|

      first = row[0]
      last = row[1]
      salary = row[2].to_f
      position = row[3]
      bonus = row[4].to_f
      quota = row[5].to_f
      percent = row[6].to_f

      if position == 'owner'
        employee = Owner.new(first, last, position, salary, bonus)
      elsif position == 'commission sales'
        employee = CommissionSales.new(first, last, position, salary, percent)
      elsif position == 'quota sales'
        employee = QuotaSales.new(first, last, position, salary, bonus, quota)
      else
        employee = self.new(first, last, position, salary)
      end

      employees << employee
    end
    employees
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
