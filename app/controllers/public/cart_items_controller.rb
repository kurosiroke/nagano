class Public::CartItemsController < ApplicationController
    before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]
end
