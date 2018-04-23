require 'byebug'
class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss 
  end 
  
  def bonus(multiplier)
    bonus = salary * multiplier
  end 
  
  def employees
    []
  end
  
  
  attr_reader :name, :title, :salary, :boss
end 

class Manager < Employee
  attr_reader :employees
  def set_employees(employees)
    @employees = employees
  end 
  
  def bonus(multiplier)
    salary_adder * multiplier
  end
  
  def salary_adder
    sum = 0
    employees.each do |employee|
       employee.class == Manager ? sum += employee.salary_adder + employee.salary : sum += employee.salary       
    end
    return sum
  end
    
  
end 

if $PROGRAM_NAME == __FILE__
  ned = Manager.new('Ned', "Founder",1_000_000, nil)
  darren = Manager.new("Darren", "TA Manager", 78_000, ned)
  shawna = Employee.new("Shawna", "TA", 12_000, darren)
  david = Employee.new("David", "TA", 10_000, darren)
  
  ned.set_employees([darren])
  darren.set_employees([shawna, david])
  
  
  puts ned.bonus(5)
  puts darren.bonus(4)
  puts david.bonus(3)
end 