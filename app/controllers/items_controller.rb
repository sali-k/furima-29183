class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handing_time_id, :price ,:image).merge(user_id: current_user.id)
  end
end
