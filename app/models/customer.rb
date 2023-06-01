class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_many :cart_items
    has_many :orders
    
    #enum payment_method: { false: 0, transfer: 1 }
      # 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana 
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @cus.update(is_deleted: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end 
end
