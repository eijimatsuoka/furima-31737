class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      authenticate_user!
    else
      render :new
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, :image, :price).merge(user_id: current_user.id)
  end
end
