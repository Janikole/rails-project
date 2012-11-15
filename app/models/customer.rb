class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders
  
  validates_presence_of :province, :f_name, :l_name, :city, :address, :postal_code
end
