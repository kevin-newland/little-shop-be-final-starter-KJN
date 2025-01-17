class CreateCoupons < ActiveRecord::Migration[7.1]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :unique_code
      t.decimal :percent_off
      t.float :dollar_off

      t.timestamps
    end
  end
end
