class OrderDetail < ApplicationRecord
     belongs_to :orders, :items
end
