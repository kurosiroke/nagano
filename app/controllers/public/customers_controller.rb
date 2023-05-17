class Public::CustomersController < ApplicationController
  before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]
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
  end

end
