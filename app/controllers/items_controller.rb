class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    # @items = Item.all
  end
end
