require "employee"

class Startup

    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = Array.new(0)
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        salaries.key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name,title)
        if valid_title?(title)
            new_p = Employee.new(employee_name,title)
            @employees << new_p
        else
            raise "Title is invalid"
        end
    end

    def size
        @employees.length

    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Not enough funding to pay employee"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        total = 0
        @employees.each do |el| total += salaries[el.title] end
        total / @employees.length.to_f
    end

    def close
        @employees = Array.new(0)
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each_pair do |title,salary|
            @salaries[title] = salary if !@salaries.key?(title)
        end
        @employees += startup.employees
        startup.close
    end
end
