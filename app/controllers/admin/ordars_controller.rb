class Admin::OrdarsController < ApplicationController
    before_action :authenticate_admin!
    
    def show
    end

end
