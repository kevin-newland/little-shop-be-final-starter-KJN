# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d little_shop_development db/data/little_shop_development.pgdump"
puts "Loading PostgreSQL Data dump into local database with command:"
puts cmd
system(cmd)
# merchant1 = Merchant.create!(name: "Test Merchant1")
# merchant2 = Merchant.create!(name: "Test Merchant2")
# merchant3 = Merchant.create!(name: "Test Merchant3")
# merchant4 = Merchant.create!(name: "Test Merchant4")

# coupon = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, merchant: merchant1)
# coupon = Coupon.create(name: "Spring Sale", unique_code: "SPS2025", percent_off: nil, dollar_off: 25.00, merchant: merchant1)
# coupon = Coupon.create(name: "Summer Sale", unique_code: "SUS2025", percent_off: 10.0, dollar_off: nil, merchant: merchant3)
# coupon = Coupon.create(name: "Fall Sale", unique_code: "FS2025", percent_off: nil, dollar_off: 50.00, merchant: merchant4)