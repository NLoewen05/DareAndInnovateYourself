class Shop < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :categories, as: :categorizable
  has_many :products

  # Validations
  validates :name, presence: true
  
end
