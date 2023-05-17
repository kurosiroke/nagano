class Public::ItemsController < ApplicationController

    def index
      @items = Item.all
    end
    
    def create
      
    end
    
    def update
      @item = Item.find(params[:id])
    end
    
    def destroy
    end
    
    def  destroy_all
    end
    
      
    private

end
