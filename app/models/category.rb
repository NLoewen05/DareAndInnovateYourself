class Category < ApplicationRecord
  # Associations
  belongs_to :categorizable, polymorphic: true

  # Validations
  validates :name, presence: true, uniqueness: true
end
