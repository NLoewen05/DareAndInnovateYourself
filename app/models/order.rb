class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :line_items
  has_many :skus, :through => :line_items

  #Validations
  validates :order_date, presence: true
end
