class Shop < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :products

  # Validations
  validates :name, presence: true
  
end
