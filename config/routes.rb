Rails.application.routes.draw do
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #顧客トップ
  scope module: :public do
   get '/' => 'homes#top'
   get 'homes/about' =>'homes#about', as: "about"
   get '/my_page' => 'customers#show'
   get 'costomers/edit'
   patch 'costomers/update'
   get 'customers/unsubscribe'
   get 'customers/withdrawal'   
   
  end

  #商品
  scope module: :items do
    resources :items, only: [:index, :show]
  end

  #顧客の会員登録
  scope module: :registrations do
    resources :registrations, only: [:new, :create]
  end

  #顧客のログイン
  scope module: :sessions do
    resources :sessions, only: [:new, :create, :destroy]
  end

  #顧客登録情報
  scope module: :public do

  end

 #カート
  scope module: :cart_items do
    delete 'delete/destroy_all'
    resources :cart_items, only:[:index, :update, :create, :destroy]
  end

 #注文
  scope module: :orders do
   post 'orders/confirm'
   get 'orders/complete'
   resources :orders, only:[:new, :create, :index, :show]
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/admin' => 'homes#top'
    resources :admin, only: [:new, :create, :show, :edit, :index, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

