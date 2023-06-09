Rails.application.routes.draw do
  root to: 'public/homes#top'
  # 顧客用 #顧客の会員登録#顧客のログイン
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
   
   # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #顧客トップ
  scope module: :public do
   get '/' => 'homes#top'
   get 'homes/about' =>'homes#about', as: "about"
   get '/my_page' => 'customers#show'
   get 'costomers/edit' => 'customers#edit'#顧客登録情報
   patch 'costomers/update' => 'customers#update'
   get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe' # 退会確認画面
   patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'  # 論理削除用のルーティング
   resources :items, only: [:index, :show]
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :cart_items, only:[:index, :update, :create, :destroy]
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   resources :orders, only:[:new, :create, :index, :show]
  end

 
  namespace :admin do
    get '/' => 'homes#top'
    resources :orders, only: [:show]
    #resources :admin, only: [:new, :create, :show, :edit, :index, :update, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

