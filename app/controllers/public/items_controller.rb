class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
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
