class Address < ApplicationRecord
  # Associations
  belongs_to :province
  belongs_to :addressable, polymorphic: true

  # Validations
  validates :address_type, :address_line, :city, :postal_code, presence: true
  validates :address_type, format: { with: /(billing|delivery|shipping)/,
  message: 'must be a valid type'}

  # Constants
  TYPE_BILLING = "billing"
  TYPE_DELIVERY = "delivery"
  TYPE_SHIPPING = "shipping"
end
