class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :building, :block, :phone_number).merge(user_id: current_user.id)
  end
end
