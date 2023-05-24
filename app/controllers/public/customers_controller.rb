class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
  
  def show
    #@customer =  Customer.find(params[:id])
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

end
