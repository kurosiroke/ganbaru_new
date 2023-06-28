Rails.application.routes.draw do
  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # 利用者
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do
   get 'homes/about' =>'homes#about', as: "about"
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
