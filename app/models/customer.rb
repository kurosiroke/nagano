class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, :first_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
            
  validates :email, presence: true
  
  validates :last_name_kana, :first_name_kana, presence: true 
            
         
         
    has_many :cart_items
    has_many :orders
    
    #enum is_delete: { false: 0, true: 1 }
      # 会員フルネーム
  def full_name
    last_name + " " + first_name
  end
  
  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana 
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @cus.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end 
end
