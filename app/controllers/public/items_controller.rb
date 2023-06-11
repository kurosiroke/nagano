class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
    def index
      @items = Item.all
    end
    
    def create

    end
    
    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end
    
    def update
        @item = Item.find(params[:id])
    end
    
    def destroy
    end
    
    def  destroy_all
    end
    
      
    private
     def item_params
     params.require(:item).permit(:image, :name, :introduction, :price)
     
     end
end
