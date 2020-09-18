class ItemsController < ApplicationController

 def new
   @items = Items.new
 end
end
