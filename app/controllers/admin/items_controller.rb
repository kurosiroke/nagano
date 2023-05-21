class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
    
    def index
        @items =Item.all
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        @item.admin_id = current_admin.id
    if @itemk.save
     redirect_to item_path(@item.id)
    else
      @items = Item.all
      @admin = current_admin
     render items_path
    end
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id)
    end 
    
    
     private
     def item_params
     params.require(:item).permit(:image, :body)
     end
     
end
