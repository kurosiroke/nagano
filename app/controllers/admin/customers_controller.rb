class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    
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
      @customer = Customer.find(params[:id])
      
      if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer.id)
      else
        render :edit
      end
      
      
    #   @customer = Customer.new(customer_params)
    #   @customer._id = Admin_costomer.id
    # if @customer.save
    #   radirect_to customer_path
    # else
    #   render :new
    # end
    
    end
    
    private
     def customer_params
     params.require(:customer).permit(:last_name, :first_name, :email, :is_deleted, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
     end
    
end
