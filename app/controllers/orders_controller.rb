class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:id])
  end

  def create
    @order = Orders.create(orders_params)
    redirect_to root_path
  end

  private
  def orders_params
    params.require(:item).permit(:image, :name, :price, :item_info, :genre_id, :comdition_id, :delivery_id, :shipping_id, :deliberyday_id, ).merge(user_id: current_user.id)
  end

end
