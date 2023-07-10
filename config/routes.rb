Rails.application.routes.draw do
  
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end
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
   get "search" => "searches#search"
   resources :attempts, only: [:index, :show, :edit, :new, :update, :create, :destroy] do#取り組み 
    
    resource :favorites, only: [:create, :destroy]
    collection do
        get :ganbaru #がんばるアクション
        get :ganbatta#がんばったアクション
        get :my_ganbaru
        get :my_ganbatta
        get 'favorites' => 'favorites#index'
        resources :speeches, only: [:create] #コメント
    end
   end
   
   resources :mypages, only: [:show] do# ユーザーdo
    collection do
        get :ganbaru
        get :ganbatta
    end
   end
   
   resources :profiles, only: [:edit,:update] #プロフィール
   resources :users, only: [:show] do
    collection do
        get :ganbaru
        get :ganbatta
    end   
   end
   
end


  # 管理者
 namespace :admin do
   get '/' => 'admin/homes#top'
   resources :attempts, only: [:index, :destroy]
   resources :users, only: [:index, :destroy]
   resources :speeches, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
end