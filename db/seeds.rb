# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env 
when 'development'
  AdminUser.create(:email => 'admin@example.com', :password => 'password',
                    :password_confirmation => 'password')
  example_user = User.create(:email => 'user@example.com', :username => 'user',
                            :password => 'password', :password_confirmation => 'password')

  example_user.shop = Shop.new(:name => "Test Shop")

  provinces = ['Alberta', 'British Columbia', 'Manitoba',
              'New Brunswick', 'Newfoundland and Labrador', 'Nova Scotia',
              'Ontario', 'Prince Edward Island', 'Quebec', 'Saskatchewan']

  provinces.each { |p| Province.create(:name => p) }

  manitoba = Province.find_by(:name => "Manitoba")

  example_user.addresses.build(address_type: "Billing", address_line: "95 Mallard Way",
                               city: "Winnipeg", province: manitoba,
                               postal_code: "R2R1P9").save        
  example_user.addresses.build(address_type: "Delivery", address_line: "93 Garton Avenue",
                               city: "Winnipeg", province: manitoba,
                               postal_code: "R0R2D2").save
end