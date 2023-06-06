class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
  def top
      # @orders = admin_customer.orders
  end
  
end
