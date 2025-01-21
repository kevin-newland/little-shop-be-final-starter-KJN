class Coupon < ApplicationRecord
  belongs_to :merchant
  has_many :invoices

  validates :unique_code, presence: true, uniqueness: true

  def self.filter_by_status(status)
    if status == "true"
      active_status = true
    elsif status == "false"
      active_status = false
    end
    where(active: active_status)
  end

  def self.active_coupons
    where(active: true)
  end
end