class OrderProductsController < ApplicationController
  # GET /order_products
  # GET /order_products.json
  def index
    @order_products = OrderProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_products }
    end
  end

  # GET /order_products/1
  # GET /order_products/1.json
  def show
    @order_product = OrderProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_product }
    end
  end

  # GET /order_products/new
  # GET /order_products/new.json
  def new
    @order_product = OrderProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_product }
    end
  end

  # GET /order_products/1/edit
  def edit
    @order_product = OrderProduct.find(params[:id])
  end

  # POST /order_products
  # POST /order_products.json
  def create
    @order_product = OrderProduct.new(params[:order_product])

    respond_to do |format|
      if @order_product.save
        format.html { redirect_to @order_product, notice: 'Order product was successfully created.' }
        format.json { render json: @order_product, status: :created, location: @order_product }
      else
        format.html { render action: "new" }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_products/1
  # PUT /order_products/1.json
  def update
    @order_product = OrderProduct.find(params[:id])

    respond_to do |format|
      if @order_product.update_attributes(params[:order_product])
        format.html { redirect_to @order_product, notice: 'Order product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_products/1
  # DELETE /order_products/1.json
  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy

    respond_to do |format|
      format.html { redirect_to order_products_url }
      format.json { head :no_content }
    end
  end
end
