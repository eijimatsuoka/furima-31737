class PurchacesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchace_address = PurchaceAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchace_address = PurchaceAddress.new(purchace_params)
    if @purchace_address.valid?
      pay_item
      @purchace_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
   def purchace_params
    params.require(:purchace_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
   end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchace_params[:token],
      currency: 'jpy'
    )
  end

end
