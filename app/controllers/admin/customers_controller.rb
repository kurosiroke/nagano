class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
    
    def index 
      @customers = Customer.all
    end

    def show
      @customer = Customer.find(params[:id])
    end

    def edit
      @customer = Customer.find(params[:id])
    end
    
    def update
      @customer = Customer.new(customer_params)
      @customer.usre_id = Admin_costomer.id
    if @customer.save
      radirect_to customer_path
    else
      render :new
    end
    
    end
    
    private
     def customer_params
     params.require(:customer).permit(:name, :email, :is_deleted)
     end
    
end
