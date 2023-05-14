Rails.application.routes.draw do
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #顧客トップ
  scope module :public do
   get '/top' => 'homes#top'
   get 'homes/about'
  end

  #商品
  scope :items do
    resources :items, only: [:index, :show]
  end

  #顧客の会員登録
  scope :registrations do
    resources :registrations, only: [:new, :create]
  end

  #顧客のログイン
  scope :sessions do
    resources :sessions, only: [:new, :create, :destroy]
  end

  #顧客登録情報
  scope :customers do
    get 'costomers/show'
    get 'costomers/edit'
    patch 'costomers/update'
    get 'customers/unsubscribe'
    get 'customers/withdrawal'
  end

 #カート
  scope :cart_items do
    delete 'delete/destroy_all'
    resources :cart_items, only:[:index, :update, :create, :destroy]
  end

 #注文
  scope :orders do
   post 'orders/confirm'
   get 'orders/complete'
   resources :orders, only:[:new, :create, :index, :show]
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  scope module: :admin do
    get '/admin' => 'homes#top'
    resources :admin, only: [:new, :create, :show, :edit, :index, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

