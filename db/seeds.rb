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

# coupon1 = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, merchant_id: merchant1.id)
# coupon2 = Coupon.create(name: "Spring Sale", unique_code: "SPS2025", percent_off: nil, dollar_off: 25.00, merchant_id: merchant1.id)
# coupon3 = Coupon.create(name: "Summer Sale", unique_code: "SUS2025", percent_off: 10.0, dollar_off: nil, merchant_id: merchant3.id)
# coupon4 = Coupon.create(name: "Fall Sale", unique_code: "FS2025", percent_off: nil, dollar_off: 50.00, merchant_id: merchant4.id)


# invoice1 = Invoice.create!(customer_id: 12, merchant_id: merchant1.id, coupon_id: coupon1.id, status: "shipped")
# invoice2 = Invoice.create!(customer_id: 12, merchant_id: merchant1.id, coupon_id: coupon1.id, status: "shipped")
# invoice3 = Invoice.create!(customer_id: 12, merchant_id: merchant2.id, coupon_id: coupon2.id, status: "shipped")
# invoice4 = Invoice.create!(customer_id: 12, merchant_id: merchant3.id, coupon_id: coupon3.id, status: "shipped")
# 
#
# coupon11 = Coupon.create!(name: "Winter Sale", unique_code: "sdvsdv", percent_off: 15.0, dollar_off: nil, merchant_id: 1)
# coupon12 = Coupon.create!(name: "Hagrid is awesome Sale", unique_code: "5181", percent_off: 15.0, dollar_off: nil, merchant_id: 1)
# coupon13 = Coupon.create!(name: "Blowout Sale", unique_code: "5151", percent_off: 20.0, dollar_off: nil, merchant_id: 1)
# coupon14 = Coupon.create!(name: "Vikings are bad Sale", unique_code: "8896", percent_off: nil, dollar_off: 10.00, merchant_id: 1)

# coupon15 = Coupon.create!(name: "Holiday Sale", unique_code: "1548", percent_off: 15.0, dollar_off: nil, merchant_id: 2)
# coupon16 = Coupon.create!(name: "Im Tired Sale", unique_code: "1861", percent_off: nil, dollar_off: 50, merchant_id: 2)
# coupon17 = Coupon.create!(name: "Confused Sale", unique_code: "1651", percent_off: 30.0, dollar_off: nil, merchant_id: 2)
# coupon18 = Coupon.create!(name: "Project Complete Sale", unique_code: "8481", percent_off: nil, dollar_off: 5, merchant_id: 2)