class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :destroy, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def index
   @items = Item.all.order("created_at DESC")
  end

  def new
   @item = Item.new
 end

 def create
    @item = Item.new(items_params)
    if @item.valid?
       @item.save
       redirect_to root_path
    else
      render :new
    end
 end

 def edit
  if current_user.id != @item.user_id
     redirect_to root_path
  end
 end
 
 def update
   @item = Item.find(params[:id])
    if @item.update(items_params)
       redirect_to item_path
    else
       render :edit
    end
 end

 def show
 end

 def destroy
  if @item.destroy
     redirect_to root_path
  else
     redirect_to item_path
  end
 end

 private
 def items_params
   params.require(:item).permit(:image, :name, :price, :item_info, :genre_id, :comdition_id, :delivery_id, :shipping_id, :deliberyday_id, ).merge(user_id: current_user.id)
 end

 def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
 end

 def set_item 
  @item = Item.find(params[:id])
 end
end
