class PurchasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
  end

  private
  def purchase_params
    params.require(:purchase).permit(:post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :name_reading, :purchase).merge(user_id: current_user.id)
  end
end