class User < ApplicationRecord

  # Devise
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :authentication_keys => [:login]

  # Associations
  has_one :shop
  has_many :orders
  has_many :addresses, as: :addressable
  
  # Validations
  validates :email, :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates_associated :addresses

  accepts_nested_attributes_for :addresses
  
  # Class Variables
  attr_accessor :login
  
  # Methods
  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

end