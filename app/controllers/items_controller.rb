class ItemsController < ApplicationController
  before_action :set_item, only: [:edit,:update,:show,:destroy]
  before_action :authenticate_user!, only: [:edit,:new]
  # newにログアウト状態で入ろうとするとログイン画面へ

  def index
    @items = Item.all
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
      end
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :instructions, :category_id, :status_id, :burden_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end