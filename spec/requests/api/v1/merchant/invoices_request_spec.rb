require "rails_helper"

RSpec.describe "Merchant invoices endpoints" do
  before :each do
    @merchant2 = Merchant.create!(name: "Merchant")
    @merchant1 = Merchant.create!(name: "Merchant Again")

    @customer1 = Customer.create!(first_name: "Papa", last_name: "Gino")
    @customer2 = Customer.create!(first_name: "Jimmy", last_name: "John")

    @invoice1 = Invoice.create!(customer: @customer1, merchant: @merchant1, status: "packaged")
    Invoice.create!(customer: @customer1, merchant: @merchant1, status: "shipped")
    Invoice.create!(customer: @customer1, merchant: @merchant1, status: "shipped")
    Invoice.create!(customer: @customer1, merchant: @merchant1, status: "shipped")
    @invoice2 = Invoice.create!(customer: @customer1, merchant: @merchant2, status: "shipped")
  end

  it "should return all invoices for a given merchant based on status param" do
    get "/api/v1/merchants/#{@merchant1.id}/invoices?status=packaged"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data].count).to eq(1)
    expect(json[:data][0][:id]).to eq(@invoice1.id.to_s)
    expect(json[:data][0][:type]).to eq("invoice")
    expect(json[:data][0][:attributes][:customer_id]).to eq(@customer1.id)
    expect(json[:data][0][:attributes][:merchant_id]).to eq(@merchant1.id)
    expect(json[:data][0][:attributes][:status]).to eq("packaged")
  end

  it "should get multiple invoices if they exist for a given merchant and status param" do
    get "/api/v1/merchants/#{@merchant1.id}/invoices?status=shipped"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end

  it "should only get invoices for merchant given" do
    get "/api/v1/merchants/#{@merchant2.id}/invoices?status=shipped"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data].count).to eq(1)
    expect(json[:data][0][:id]).to eq(@invoice2.id.to_s)
  end

  it "should return 404 and error message when merchant is not found" do
    get "/api/v1/merchants/100000/customers"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:not_found)
    expect(json[:message]).to eq("Your query could not be completed")
    expect(json[:errors]).to be_a Array
    expect(json[:errors].first).to eq("Couldn't find Merchant with 'id'=100000")
  end

  it "Return a merchants invoices and include the id of the coupon used (if one was used)" do
    Invoice.delete_all
    coupon1 = Coupon.create(name: "Winter Sale", unique_code: "WS2025", percent_off: 15.0, dollar_off: nil, merchant_id: @merchant2.id)
    coupon2 = Coupon.create(name: "Spring Sale", unique_code: "SPS2025", percent_off: nil, dollar_off: 25.00, merchant_id:@merchant1.id)

    invoice1 = Invoice.create!(customer_id: @customer1.id, merchant_id: @merchant2.id, coupon_id: coupon1.id, status: "shipped")
    invoice2 = Invoice.create!(customer_id: @customer2.id, merchant_id:@merchant1.id, coupon_id: coupon2.id, status: "shipped")
    invoice3 = Invoice.create!(customer_id: @customer2.id, merchant_id:@merchant1.id, coupon_id: coupon1.id, status: "shipped")

    get "/api/v1/merchants/#{@merchant1.id}/invoices"
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(results.count).to eq(2)
    results.each do |result|
      expect(result[:attributes][:merchant_id]).to eq(@merchant1.id)
      expect(result[:attributes]).to have_key(:coupon_id)
    end
  end
end