class CartItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @cart_items = CartItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cart_items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart_item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @cart_item = CartItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart_item }
    end
  end

  # GET /items/1/edit
  def edit
    @cart_item = CartItem.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @cart_item = CartItem.new(params[:cart_item])

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item, notice: 'Item was successfully created.' }
        format.json { render json: @cart_item, status: :created, location: @cart_item }
      else
        format.html { render action: "new" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      if @cart_item.update_attributes(params[:cart_item])
        format.html { redirect_to @cart_item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
