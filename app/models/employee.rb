class Employee < ApplicationRecord
    belongs_to :dog
    validates :alias, uniqueness: true
    validates :title, uniqueness: true

    def employee_name
        self.first_name+" "+self.last_name
    end
    def dog_name
        self.dog.name
    end
end
