class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item,only: [:index, :create, :show]
  before_action :move_to_index, only: [:index, :show]

  def index
    # ログインしている人と出品者が同じ時または商品が売れてしまっている時はroot_pathにリダイレクトするという条件式
    #  if user_signed_in? && nil != item.purchase_record
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    # binding.pry
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code_id, :item_prefecture_id, :city, :addresses, :building, :phone_number, :hoge).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase_record
  end

  # 削除
  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(purchase_id: @purchase.id)
  # end
end