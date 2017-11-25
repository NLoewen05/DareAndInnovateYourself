class Sku < ApplicationRecord
  # Associations
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :product
  has_many :option_values
  has_many :options, through: :product
  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '1024x1024>'
  }, :default_url => ":style/placeholder.png"

  # Validations
  validates :price, :quantity, :picture, presence: true
  validates :quantity, numericality: { only_integer: true}
  validates :price, numericality: true
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  def name
    product.name + ' - ' + id.to_s
  end

  def picture_url
    'http://' + picture.url
  end
end
