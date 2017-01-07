Rails.application.routes.draw do
  get 'restaurant/index'

  get 'menu/index'

  root to: 'welcome#index'
  get 'welcome/index'
  get 'reservation/index'
  get 'reservation/create'

  resources :users
  resource :session, only: [:new,:create,:destroy]
  get '/login' =>'sessions#new', as: "login"
  get '/logout' => 'sessions#destroy', as: "logout"
  get '/signin' =>'users#new', as: "signin"
  get '/menu/index', as: "menu"
  get '/restaurant/index', as: "restaurant"
  get '/franchise/index', as: "franchise"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
