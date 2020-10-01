class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:edit, :index]

  def index
    @item = Item.find(params[:item_id])
    @user_orders = UserOrders.new
    if current_user.id == @item.user_id 
       redirect_to root_path
    end 
  end

  def edit
    if current_user.id != @user_orders.user_id
       redirect_to root_path
    end
  end

  def create
    @user_orders = UserOrders.new(order_params)
    if @user_orders.valid?
      @user_orders.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params 
    params.permit(:item_id, :token, :post_codo, :shipping_id, :city, :addresses, :building, :phone).merge(user_id: current_user.id) 
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段  
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
