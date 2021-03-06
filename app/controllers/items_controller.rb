class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :update, :destroy]
  before_action :set_item,only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    if @item.update(furima_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

    private
  def furima_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id || @item.purchase_record.present?
  end
end
