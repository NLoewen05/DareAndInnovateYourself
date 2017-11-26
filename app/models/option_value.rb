class OptionValue < ApplicationRecord
  # Associations
  belongs_to :option
  belongs_to :sku

  # Validations
  validates :option, uniqueness: true
  validates :value, presence: true
end
