class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
    
      def index
          @cart_items = current_customer.cart_items
          @total_cash = 0
          @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
      end
      
      def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id=current_customer.id
        @cart_items = current_customer.cart_items.all
         if @cart_items.find_by(item_id: @cart_item.item_id).present?
            new_amount = @cart_items.find_by(item_id: @cart_item.item_id).amount + @cart_item.amount
            @cart_items.find_by(item_id: @cart_item.item_id).update_attribute(:amount, new_amount)
         end
        @cart_item.save
        redirect_to cart_items_path
      end
        
      def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        if @cart_items.cart_items.find_by(item_id: params[:cart_item][:item.id])
         cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
         cart_item.amount += params[:cart_item][:amount].to_i
         cart_item.save
         redirect_to cart_items_path
        elsif @cart_item.save
            　@cart_items = current_member.cart_items.all
            　render cart_items_path
        end
      end
      
      def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
      end
      
      def destroy_all
        current_customer.cart_items.destroy_all
        redirect_to cart_items_path
      end
      
     private
     
     def cart_item_params
         params.require(:cart_item).permit(:item_id, :customer_id, :price, :amount, :destroy)
     end
end
