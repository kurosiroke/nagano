class OrderDetail < ApplicationRecord
     belongs_to :order
     belongs_to :item

     def total_price
       price * amount
     end

end
