class ItemsController < ApplicationController


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
 end
 
 def update
 end

 def show
    @items = Item.find(params[:id])
 end

 private
 def items_params
   params.require(:item).permit(:image, :name, :price, :item_info, :genre_id, :comdition_id, :delivery_id, :shipping_id, :deliberyday_id, ).merge(user_id: current_user.id)
 end

end
