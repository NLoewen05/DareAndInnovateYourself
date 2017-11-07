class Product < ApplicationRecord
  # Associations
  has_one :category, as: :categorizable
  belongs_to :shop
  has_many :skus
  has_many :options, as: :optionable

  # Validations
  validates :name, presence: true, uniqueness: true
end
