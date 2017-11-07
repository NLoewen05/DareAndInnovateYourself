class OptionValue < ApplicationRecord
  # Associations
  belongs_to :option
  belongs_to :sku

  # Validations
  validates :value, presence: true
end
