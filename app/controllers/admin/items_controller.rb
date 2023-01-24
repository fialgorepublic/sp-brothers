class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: %i[show edit destroy update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @colors = @item.colors.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to admin_item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_items_path, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def item_params
    params.require(:item).permit(:number, :name, :price, :active_item, :category, :special_price_item, :picture, { product_pictures: [] }, colors_attributes: [:id, :code, :quantities, :order_quantities, :available_date, { pictures: [] }, :_destroy])
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
