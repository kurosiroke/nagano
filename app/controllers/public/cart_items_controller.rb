class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
    
      def create
     
      end

     private
     def cart_item_params
         params.require(:cart_item).permit(:item_id, :amount)
     end
end
