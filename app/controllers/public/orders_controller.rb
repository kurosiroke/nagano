class Public::OrdersController < ApplicationController
    before_action :authenticate_customers!, except: [:top, :about, :items, :registrations]

    def new
    end
    
    def confirm
    end
    
    def complete
        
    end
    
    def create
        
    end
    
    def index
    end
    
    def show
    end

end
