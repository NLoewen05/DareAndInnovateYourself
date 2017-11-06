class Option < ApplicationRecord
  belongs_to :optionable, polymorphic: true
  has_many :option_values
end
