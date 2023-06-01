class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details

    
    enum payment_way: ["クレジットカード","銀行振込"]
end
