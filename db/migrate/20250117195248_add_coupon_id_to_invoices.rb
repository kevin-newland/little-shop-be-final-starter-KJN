class AddCouponIdToInvoices < ActiveRecord::Migration[7.1]
  def change
    add_column :invoices, :coupon_id, :bigint
    add_foreign_key :invoices, :coupon
    add_index :invoices, :coupon_id
  end
end
