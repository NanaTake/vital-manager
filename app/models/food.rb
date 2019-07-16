class Food < ApplicationRecord

  validates :name, presence: true
  validates :calorie, presence: true
end
