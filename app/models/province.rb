class Province < ApplicationRecord
  # Associations
  has_many :address

  # Validations
  validates :name, presence: true
end
