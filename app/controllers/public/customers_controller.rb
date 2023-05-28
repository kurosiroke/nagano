class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
  
  def show
    @customer = current_customer
    
  end

  def edit
  end

  def update
  end

  def unsubscribe
  
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    ridirect_to root_path
  end
    
  private
     def customer_params
     params.require(:customer).permit(:full_name, :first_name, :email, :is_deleted)
     end
end
