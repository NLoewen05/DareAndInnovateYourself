class Address < ApplicationRecord
  has_one :province
  belongs_to :addressable, polymorphic: true
end
