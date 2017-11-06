class Sku < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :product
  has_many :options, as: :optionable
end
