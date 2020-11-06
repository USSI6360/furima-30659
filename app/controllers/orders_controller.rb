class OrdersController < ApplicationController

  def index
    @order=Address.ids
    @item = Item.find(params[:item_id])
    @order = Order.new
    @buy = Buy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.new(address_params)
    # binding.pry
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
    # params.require(:buy).permit(:yubin, :prefecture_id, :municipality, :number, :building, :tell,:item_id).merge(user_id: current_user.id,token: params[:token])
    params.require(:buy).permit(:order_id, :yubin, :prefecture_id, :municipality, :number, :building, :tell).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end

  # def order_params
  #   params.require(:order).permit(:price).merge(token: params[:token])
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: address_params[:token],
      currency: 'jpy' 
    )
  end
end