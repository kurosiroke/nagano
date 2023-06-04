class Public::OrdersController < ApplicationController
    #before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]

    def new
        @order = Order.new
        @address = current_customer.address
    end
    
    def confirm
        @order = Order.new(orders_params)
        @cart_items = current_customer.cart_items.all
    end
    
    def complete
    end
    
    def create
        @order = Order.new(orders_params)
        @order.save
        current_customer.cart_items.each do |cart|
                  order_item = OrderDetail.new
                  order_item.item_id = cart.item_id
                  order_item.order_id = @order.id
                  order_item.amount = cart.amount
                  order_item.price = cart.item.price
                  order_item.save
        end
        current_customer.cart_items.destroy_all
        
        redirect_to orders_complete_path
        
    end
    
    def index
    end
    

    private
     def orders_params
     params.require(:order).permit(:postage, :payment_way, :postal_code, :address, :last_name, :first_name, :total_payment, )
     
     end
end
