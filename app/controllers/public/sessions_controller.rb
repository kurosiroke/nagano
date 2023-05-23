# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
    def after_sign_in_path_for(resource)
       items_path(resource)
    end
    
    def after_sign_out_path_for(resource)
       root_path
    end
    
    protected
# 退会しているかを判断するメソッド↓
    def customer_state
           #  emailが存在していればそのアカウントをとってくる
        @customer = Customer.find_by(email: params[:customer][:email])
          # アカウントのメールアドレスが正しいかを確認↓
        return if !@customer
         #パスワード間違ってたらはじく↓
        if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted)
        # ↓　飛ばず
        redirect_to new_user_session_path
    
        end
    end
  
end


