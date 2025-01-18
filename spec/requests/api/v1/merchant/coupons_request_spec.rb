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
    expect(results[:attributes][:percent_off]).to be_a(String).or(be_nil)
    expect(results[:attributes][:dollar_off]).to be_a(Float).or(be_nil)
    expect(results[:attributes][:merchant_id]).to eq(merchant1.id)
    expect(results[:attributes][:times_used]).to be_a(Integer)
  end

  it "Returns all of a merchants coupons" do
    merchant1 = Merchant.create!(name: "Test Merchant1")
    coupon = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, merchant: merchant1)
    coupon = Coupon.create(name: "Spring Sale", unique_code: "SPS2025", percent_off: nil, dollar_off: 25.00, merchant: merchant1)

    get "/api/v1/merchants/#{merchant1.id}/coupons"
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)[:data] 

    expect(results.count).to eq(2)

    results.each do |result|
      expect(result).to have_key(:id)
      expect(result[:id]).to be_a(String)

      expect(result).to have_key(:type)
      expect(result[:type]).to be_a(String)

      expect(result).to have_key(:attributes)
      expect(result[:attributes]).to have_key(:name)
      expect(result[:attributes][:name]).to be_a(String)
      expect(result[:attributes][:unique_code]).to be_a(String)
      expect(result[:attributes][:percent_off]).to be_a(String).or(be_nil)
      expect(result[:attributes][:dollar_off]).to be_a(Float).or(be_nil)
      expect(result[:attributes][:merchant_id]).to eq(merchant1.id)
    end
  end
end