class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.decimal :gst_rate
      t.decimal :pst_rate
      t.decimal :hst_rate

      t.timestamps
    end
  end
end
