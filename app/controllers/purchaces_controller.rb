class PurchacesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchace_address = PurchaceAddress.new
  end

  def create
    @purchace_address = PurchaceAddress.new(purchace_params)
    if @purchace_address.varid?
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
   def purchace_params
    params.require(:purchace_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
   end

   def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, :image, :price).merge(user_id: current_user.id)
  end
end
