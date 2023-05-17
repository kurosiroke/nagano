class Admin::OrdarsController < ApplicationController
    before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
end
