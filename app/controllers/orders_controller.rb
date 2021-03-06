class OrdersController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "letmein", :only => [:index, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @cust_id = params[:cust_id]
    @product = session[:product]
    @province = Province.find(Customer.find(@cust_id).province_id)
    
    @price = @product.price.round(2)
    @gst = @province.gst_rate/100
    @pst = @province.pst_rate/100
    @hst = @province.hst_rate/100
    
    @total = @price * ((@gst + @pst + @hst) + 1)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order_product = @order.order_products.build
    
    @order_product[:product_id] = session[:product][:id]
    @order_product[:quantity] = 1
    @order_product[:price] = session[:product][:price]

    respond_to do |format|
      if @order.save
        format.html { redirect_to summary_path(:order => @order)}
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
