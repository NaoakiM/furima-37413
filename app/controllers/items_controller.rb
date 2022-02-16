class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]
  def index
    # @items = Item.all
  end

  def new
    # @items = Item.all
  end

  def creat
    # @items = Item.all
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end
end
