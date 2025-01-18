class ChangeCouponIdToBigintAndAddIndexToInvoices < ActiveRecord::Migration[7.1]
  def change
    change_column :invoices, :coupon_id, :bigint
    unless index_exists?(:invoices, :coupon_id)
      add_index :invoices, :coupon_id
    end
  end
end
