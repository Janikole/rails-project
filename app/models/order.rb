class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_products
  has_many :products, :through => :order_products
  
  validates_presence_of :cust_id, :gst_rate, :pst_rate, :hst_rate, :status, :payment_method
  validates_inclusion_of :status, :in => ['Paid', 'Shipped']
end
