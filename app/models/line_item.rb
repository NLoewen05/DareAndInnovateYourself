class LineItem < ApplicationRecord
  belongs_to :sku, -> { includes :product }
  belongs_to :order
end
