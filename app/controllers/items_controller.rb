class ItemsController < ApplicationController

 def index
   @items = Item.all
 end

 def new
   @item = Item.new
 end

 def create
    @item = Item.new(items_params)
    if @item.save
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
 end

 private
 def items_params
   params.require(:item).permit(:image, :name, :price, :item_info, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :delivery_day_id, ).merge(user_id: current_user.id)
 end

end
