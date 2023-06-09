class Item < ApplicationRecord

    has_many :cart_items
    has_many :order_details

    has_one_attached :image
    
    validates :image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true

   def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/adp.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width,height]).processed
   end
   
   def with_tax_price
    (price * 1.1).floor
   end
   
   def number_to_currency #金額に，を付ける
        "#{price.to_s(:delimited, delimiter: ',')}"
   end
end