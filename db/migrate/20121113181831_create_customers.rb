class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :province_id
      t.string :f_name
      t.string :l_name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :email

      t.timestamps
    end
  end
end
