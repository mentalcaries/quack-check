class Dentist < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :registration_status, presence: true
end
