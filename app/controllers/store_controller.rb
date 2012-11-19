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
end
