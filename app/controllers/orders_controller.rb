class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]
  before_action :authenticate_user!

  def index
    # 出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移する
    # 購入済み商品の購入ページへ遷移しようとすると、トップページに遷移する
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(address_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

 private

  def address_params
    params.require(:buy).permit(:order_id, :yubin, :prefecture_id, :municipality, :number, :building, :tell).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: address_params[:token],
      currency: 'jpy' 
    )
  end

end