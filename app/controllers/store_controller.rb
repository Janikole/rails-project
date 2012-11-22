class StoreController < ApplicationController
  
  def index
    if params[:filter].nil? then
      @type = ""
    else
      @type = params[:filter]
    end
    
    @products = Product.where("name LIKE '%"+@type+"%'")
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def summary
    @order = Order.find(params[:order])
    @cust_id = @order[:cust_id]
    @product = session[:product]
    @province = Province.find(Customer.find(@cust_id).province_id)
    
    @price = @product.price.round(2)
    @gst = @province.gst_rate/100
    @pst = @province.pst_rate/100
    @hst = @province.hst_rate/100
    
    @total = @price * ((@gst + @pst + @hst) + 1)
  end
end
