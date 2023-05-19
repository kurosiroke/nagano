class Item < ApplicationRecord

    has_many :cart_items, :order_details

    
end
