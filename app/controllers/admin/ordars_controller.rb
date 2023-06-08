class Admin::OrdarsController < ApplicationController
    before_action :authenticate_admin!
    
    def show
        @order = Ouser.find(params[:id])
        
    end
    
    private
    
     def order_params
     params.require(:order).permit(:name, :postal_code, :address, :postage, :total_cash, :payment_way)
     end
    
    
end
