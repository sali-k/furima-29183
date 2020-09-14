class PurchasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
    if current_user.id == @item.user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def new
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.permit(:post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :purchase, :item_id).merge(user_id: current_user.id)
  end
end