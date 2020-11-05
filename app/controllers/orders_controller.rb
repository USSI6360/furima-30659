class OrdersController < ApplicationController

  def index
    @order=Address.ids
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy=Buy.new (address_params)
    
    if @buy.valid?
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

 private

  def address_params
    
    params.permit(:order_id, :yubin, :prefecture_id, :municipality, :number, :building, :tell,:item_id).merge(user_id: current_user.id)
  end
end