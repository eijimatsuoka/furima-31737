class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,]

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

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, :image, :price).merge(user_id: current_user.id)
  end
end
