class PurchasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def new
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    @purchase.save

    #if @purchase.valid?
      #@purchase.save
      #return redirect_to root_path
    #else
      #render item_purchases_path(:item_id)
    #end
  end

  private
  def purchase_params
    params.permit(:post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :purchase, :item_id).merge(user_id: current_user.id)
  end
end