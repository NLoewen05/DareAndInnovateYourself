class Shop < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :products

  # Validations
  validates :name, presence: true

  accepts_nested_attributes_for :products, allow_destroy: true
end
