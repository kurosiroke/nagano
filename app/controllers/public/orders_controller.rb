class Public::OrdersController < ApplicationController
    #before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]

    def new
        @order = Order.new
        @address = current_customer.address
    end
    
    def confirm
    end
    
    def complete
    end
    
    def create
    end
    
    def index
    end
    
    def show
    end

    private
     def orders_params
     params.require(:order).permit(:postal_code, :address, :last_name, :first_name)
     
     end
end
