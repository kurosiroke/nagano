class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :items, :registrations]
  def top
    @items = Item.all
  end

  def about
  end

end
