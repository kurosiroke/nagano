class CartItem < ApplicationRecord
    belongs_to :items, :customers
    
end
