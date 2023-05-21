class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
    
    def index 
      @admin = current_admin
      @admins = Admin.all
      @item_new = Item.new
    end

    def show
        @item_new = Item.new
        @admin = admin.find(paramus[:id])
        @items = @admin.Items
    end

    def edit
        @admin = Admin.find(params[:id])
    end
    
    def update
        @admin = Admin.new(admin_params)
        @admin.usre_id = Current_admin.id
    if @admin.save
      radirect_to admin_path
    else
      render :new
    end
    
    end
    
end
