class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
  def top
       @orders = Order.all
       
  end
  
end
