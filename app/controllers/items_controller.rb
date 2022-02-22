class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  # before_action :move_to_index, except: [:index]
  def index
    @items = Item.all.order(created_at: :desc)
    User.order("item_name")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(furima_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

    private
  def furima_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :image).merge(user_id: current_user.id)
  end
end
