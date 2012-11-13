class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cust_id
      t.decimal :gst_rate
      t.decimal :pst_rate
      t.decimal :hst_rate
      t.string :status
      t.string :payment_method

      t.timestamps
    end
  end
end
