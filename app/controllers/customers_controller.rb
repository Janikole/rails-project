class CustomersController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "letmein", :only => [:index, :update, :destroy]
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @product = Product.find(params[:prod])
    @customer = Customer.new
    
    session[:product] = @product

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    cust = params[:customer]
    
    cust[:province_id] = case cust[:province_id]
      when "BC" then 1
      when "AB" then 2
      when "SK" then 3
      when "MB" then 4
    end
        
    respond_to do |format|
      if Customer.where(cust).empty?
        @customer = Customer.new(cust)
        if @customer.save
          format.html { redirect_to new_order_path(:cust_id => @customer[:id])}
          format.json { render json: @customer, status: :created, location: @customer }
        else
          format.html { render action: "new" }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to new_order_path(:cust_id => Customer.where(cust).first)}
        format.json { render json: @customer, status: :created, location: @customer }
      end      
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
end
