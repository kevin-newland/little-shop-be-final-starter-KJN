class CouponSerializer
  include JSONAPI::Serializer
  attributes :name, :unique_code, :percent_off, :dollar_off, :active, :merchant_id

  attribute :times_used, if: Proc.new { |coupon, params|
    params[:action] == "show"
  } do |coupon|
   coupon.invoices.count
  end
  
end