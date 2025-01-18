require "rails_helper"

RSpec.describe "Merchant Coupon endpoints" do
  it "Returns a merchants coupon and how many times it has been used" do
    merchant1 = Merchant.create!(name: "Test Merchant1")
    coupon = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, merchant: merchant1)

    get "/api/v1/merchants/#{merchant1.id}/coupons/#{coupon.id}"
    expect(response.status).to eq(200)
    
    results = JSON.parse(response.body, symbolize_names: true)[:data] 

    expect(results).to have_key(:id)
    expect(results[:id]).to be_a(String)

    expect(results).to have_key(:type)
    expect(results[:type]).to be_a(String)

    expect(results).to have_key(:attributes)
    expect(results[:attributes]).to have_key(:name)
    expect(results[:attributes][:name]).to be_a(String)
    expect(results[:attributes][:unique_code]).to be_a(String)
    expect(results[:attributes][:percent_off]).to be_a(String)
    expect(results[:attributes][:dollar_off]).to be(nil)
    expect(results[:attributes][:merchant_id]).to eq(merchant1.id)
    expect(results[:attributes][:times_used]).to be_a(Integer)
  end
end