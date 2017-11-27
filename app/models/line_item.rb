class LineItem < ApplicationRecord
  # Associations
  belongs_to :sku, -> { includes :product }
  belongs_to :order

  # Validations
  validates :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true}
  validates :price, numericality: true

  def item_total
    quantity * price
  end
end
