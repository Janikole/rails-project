class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders, :dependent => :delete_all
  
  validates_presence_of :province, :f_name, :l_name, :city, :address, :postal_code
end
