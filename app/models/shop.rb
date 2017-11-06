class Shop < ApplicationRecord
  belongs_to :user
  has_many :categories, as: :categorizable
  has_many :products
end
