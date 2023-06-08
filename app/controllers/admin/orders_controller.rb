class Admin::OrdersController < ApplicationController
        before_action :authenticate_admin!
    
    def show
        @order = Order.find(params[:id])
        
    end
    
    private
    
     def order_params
     params.require(:order).permit(:name, :postal_code, :address, :postage, :total_cash, :payment_way)
     end
end
