class ItemsController < ApplicationController

 def index
   @items = Item.all
 end

 def new
   @item = Item.new
 end

 def create
    @item = Item.new(item_params)
    if @item.save
       renderect_to root_path
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
   params.require(:items).permit(:name, :price, :item_info, :category, :status_id, :delivery_fee_id, :shipping_area_id, :delivery_days_id, :user_id)
 end

end
