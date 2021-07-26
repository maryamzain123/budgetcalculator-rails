Rails.application.routes.draw do


  resources :users do
    resources :entries
    resources :categories, only: [:index, :show]
  end


  resources :categories do 
    resources :entries
  end


  get 'purchase', to: "entries#purchase"
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"


  root(to: "static#home")
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
