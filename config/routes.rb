Rails.application.routes.draw do
  
   root to: 'public/homes#top'
 
  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # 利用者
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
   # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 利用者
 scope module: :public do  
   get '/' => 'homes#top'
   get 'homes/about' =>'homes#about', as: "about"
   resources :actions, only: [:index, :show, :edit, :new, :update, :create, :destroy] do#取り組み 
    collection do
        get :ganbaru #がんばるアクション
        get :ganbatta#がんばったアクション
        get :my_ganbaru
        get :my_ganbatta
    end
   end
   resources :mypages, only: [:show] do# ユーザーdo
    collection do
        get :ganbaru
        get :ganbatta
    end
   end
   resources :profiles, only: [:edit,:update]
   resources :users, only: [:show] do
    collection do
        get :ganbaru
        get :ganbatta
    end   
   end
   resources :favorites, only: [:create, :index, :destroy] #お気に入り
   resources :comments, only: [:create] #コメント
end

  # 管理者
 namespace :admin do
   get '/' => 'homes#top'
   resources :actions, only: [:index, :destroy]
   resources :users, only: [:index, :destroy]
   resources :comments, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
end