class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
    
    def indax
    end
    
    def new
        @item =Item.new
    end
    
    def create
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
    end 
    
end
