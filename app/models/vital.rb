class Vital < ApplicationRecord
  belongs_to :user

  validates :record_date, presence: true

end
