class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
  def top
  end
  
  def about
  end 
  
  def index
  end

end
