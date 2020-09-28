class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @order = Orders.new
  # end

  def create
    @order = Order.new(price: order_params[:price])
    # @order = Orders.create(orders_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  # def orders_params
  #   params.require(:item).permit(:image, :name, :price, :item_info, :genre_id, :comdition_id, :delivery_id, :shipping_id, :deliberyday_id, ).merge(user_id: current_user.id)
  # end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_6528c01e805d7c02039be1a6"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
