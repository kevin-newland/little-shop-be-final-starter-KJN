require "rails_helper"

RSpec.describe Coupon do
  it { should belong_to :merchant }
  it { should have_many :invoices }

  it "filters by active status true" do
    merchant1 = Merchant.create!(name: "Test Merchant1")
    coupon_active = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, active: true, merchant_id: merchant1.id)
    coupon_inactive = Coupon.create(name: "Spring Sale", unique_code: "SPS2025", percent_off: nil, dollar_off: 25.00, active: false,  merchant_id: merchant1.id)

    result = Coupon.filter_by_status("true")

    expect(result.count).to eq(1)
    expect(result[0]).to eq(coupon_active)
  end

  it "filters by active status false" do
    merchant1 = Merchant.create!(name: "Test Merchant1")
    coupon_active = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, active: true, merchant_id: merchant1.id)
    coupon_inactive = Coupon.create(name: "Spring Sale", unique_code: "SPS2025", percent_off: nil, dollar_off: 25.00, active: false,  merchant_id: merchant1.id)

    result = Coupon.filter_by_status("false")
    
    expect(result.count).to eq(1)
    expect(result[0]).to eq(coupon_inactive)
  end
end