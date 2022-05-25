class Employee < ApplicationRecord
  has_and_belongs_to_many(:projects)
  belongs_to :division

  scope :search, -> (parameter) {where("name like ?", "%#{parameter}%")}
end