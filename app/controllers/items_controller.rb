class ItemsController < ApplicationController
  before_action :set_item, only: [:edit]
  before_action :authenticate_user!, only: [:new]
  # newにログアウト状態で入ろうとするとログイン画面へ

  def index
    # @item = Item.all
  end

  def edit
  end

  def create
  end

  def new
  end

  def show
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:content, :image).merge(user_id: current_user.id)
  end

end