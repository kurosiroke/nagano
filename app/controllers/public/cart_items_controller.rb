class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
    
      def index
          @cart_items = current_customer.cart_items
          @total_cash = 0
      end
      
      def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        if @cart_item.save
         redirect_to cart_items_path(@cart_item.id)
        end
      end

     private
     
     def cart_item_params
         params.require(:cart_item).permit(:item_id, :amount)
     end
end
