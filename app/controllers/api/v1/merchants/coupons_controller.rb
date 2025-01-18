class Api::V1::Merchants::CouponsController < ApplicationController
  def show
    merchant = Merchant.find(params[:merchant_id])
    coupon = merchant.coupons.find(params[:id])
    render json: CouponSerializer.new(coupon, {params: {action: "show" }})
  end

  def index 
    merchant = Merchant.find(params[:merchant_id])
    coupons = merchant.coupons.all
    render json: CouponSerializer.new(coupons)
  end
end