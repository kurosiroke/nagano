class Public::HomesController < ApplicationController
  before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]
  def top
  end

  def about
  end

end
