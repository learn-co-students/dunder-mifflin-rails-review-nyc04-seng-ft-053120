class Employee < ApplicationRecord
belongs_to :dog

validates :title, :alias, uniqueness: true, presence :true



end
