class Dog < ApplicationRecord
    has_many :employees

    def self.sort_by_employees?(input)
        if input
            self.all.sort_by do |dog|
                dog.employees.count
            end.reverse
        else
            self.all
        end
    end

end
