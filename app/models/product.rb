class Product < ApplicationRecord
  has_one :category, as: :categorizable
  belongs_to :shop
  has_many :skus
end
