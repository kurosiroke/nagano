class Public::ItemsController < ApplicationController

    def index
      @items = Item.all
    end
    
    def create
    end
    
    def upsate
    end
    
    def destroy
    end
    
    def  destroy_all
    end
    
      
    private

end
