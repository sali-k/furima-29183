class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user.id || !@item.purchase.nil?
  end

  def new
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :purchase_id, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchase.token,
      currency: 'jpy'
    )
  end
end
