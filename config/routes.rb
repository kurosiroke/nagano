Rails.application.routes.draw do
  # 顧客用 #顧客の会員登録#顧客のログイン
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #顧客トップ
  scope module: :public do
   get '/' => 'homes#top'
   get 'homes/about' =>'homes#about', as: "about"
   get '/my_page' => 'customers#show'
   get 'costomers/edit'#顧客登録情報
   patch 'costomers/update'
   get 'customers/unsubscribe'
   get 'customers/withdrawal'   
   resources :items, only: [:index, :show]
   delete 'delete/destroy_all'
   resources :cart_items, only:[:index, :update, :create, :destroy]
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
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

