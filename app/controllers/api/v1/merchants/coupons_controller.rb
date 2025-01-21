class Api::V1::Merchants::CouponsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :not_valid
  def show
    merchant = Merchant.find(params[:merchant_id])
    coupon = merchant.coupons.find(params[:id])
    render json: CouponSerializer.new(coupon, {params: {action: "show" }})
  end

  def index 
    merchant = Merchant.find(params[:merchant_id])
    if params[:active].present?
      coupons = merchant.coupons.filter_by_status(params[:active])
    else
      coupons = merchant.coupons.all
    end
    render json: CouponSerializer.new(coupons)
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    if merchant.coupons.active_coupons.count >= 5
      render json: {error: "this merchant already has 5 active coupons"}
      return
    end
    coupons = merchant.coupons.create!(coupon_params)
    render json: CouponSerializer.new(coupons), status: :created
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    coupon = merchant.coupons.find(params[:id])
    coupon.update(coupon_params)
    render json: CouponSerializer.new(coupon), status: :ok
  end

  private

  def coupon_params
    params.permit(:name, :unique_code, :percent_off, :dollar_off, :active)
  end

  def not_found(exception)
    render json: {error: exception.message}, status: :not_found
  end

  def not_valid(exception)
    render json: {error: exception.message}, status: :not_valid
  end
end