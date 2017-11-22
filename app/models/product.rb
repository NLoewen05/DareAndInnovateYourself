class Product < ApplicationRecord
  # Associations
  belongs_to :shop
  belongs_to :category
  has_many :skus
  has_many :options, as: :optionable

  # Validations
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :skus

end
