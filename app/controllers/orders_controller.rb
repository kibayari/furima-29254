class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  
  def create
    @user_orders = UserOrders.new(order_params)
    if @user_orders.valid?
      @user_orders.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params 
    params.permit(:item_id, :token, :post_codo, :shipping_id, :city, :addresses, :building, :phone).merge(user_id: current_user.id) 
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_6528c01e805d7c02039be1a6"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段  
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
