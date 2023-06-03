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
        @order = Order.new(order_params)
        @order.save
    end
    
    def index
    end
    

    private
     def orders_params
     params.require(:order).permit(:payment_methpd, :postal_code, :address, :last_name, :first_name)
     
     end
end
