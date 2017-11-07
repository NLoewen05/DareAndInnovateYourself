class Option < ApplicationRecord
  # Associations
  belongs_to :optionable, polymorphic: true
  has_many :option_values

  # Validations
  validates :name, presence: true, uniqueness: true
end
