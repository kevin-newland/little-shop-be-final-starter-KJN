class ChangeCouponIdToBigintAndAddIndexToInvoices < ActiveRecord::Migration[7.1]
  def change
    change_column :invoices, :coupon_id, :bigint
    add_index :invoices, :coupon_id
  end
end
