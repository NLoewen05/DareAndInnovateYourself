class Sku < ApplicationRecord
  # Associations
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :product
  has_many :option_values
  has_many :options, through: :product

  # Validations
  validates :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true}
  validates :price, numericality: true
  
  def name
    product.name + ' - ' + id.to_s
  end
end
