class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index]
  before_action :set_orders, only: [:index, :create]


  def index
    @user_orders = UserOrders.new
    if current_user.id == @item.user_id 
       redirect_to root_path
    end 
  end

  def create
    @user_orders = UserOrders.new(order_params)
    if @user_orders.valid?
      pay_item
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段  
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_orders
  @item = Item.find(params[:item_id])
  end

end
