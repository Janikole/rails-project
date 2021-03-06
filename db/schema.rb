# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121115065353) do

  create_table "customers", :force => true do |t|
    t.integer  "province_id"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "order_products", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "cust_id"
    t.decimal  "gst_rate"
    t.decimal  "pst_rate"
    t.decimal  "hst_rate"
    t.string   "status"
    t.string   "payment_method"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.integer  "stock_quantity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "image"
  end

  create_table "provinces", :force => true do |t|
    t.decimal  "gst_rate",   :precision => 4, :scale => 3
    t.decimal  "pst_rate",   :precision => 4, :scale => 3
    t.decimal  "hst_rate",   :precision => 4, :scale => 3
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "name"
  end

end
