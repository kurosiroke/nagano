class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!, except: [:top, :about, :items, :registrations]
    def indax
    end
end
