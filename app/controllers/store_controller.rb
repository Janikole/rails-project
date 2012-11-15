class StoreController < ApplicationController
  
  def index
    @products = Product.all()
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def purchase
    @product = Product.find(params[:id])
    @customer = Customer.new
    @customer.orders.build
    #@order_product = @order.order_products.build
  end
  
  def create
  end
end
