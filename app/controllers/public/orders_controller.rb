class Public::OrdersController < ApplicationController
    before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]
end
