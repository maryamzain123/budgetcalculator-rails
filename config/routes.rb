Rails.application.routes.draw do


  resources :users 
  #   resources :entries
  #   resources :categories, only: [:index, :show]
  

  resources :categories, only: [:index, :show] do 
    resources :entries
  end



  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get 'welcome', to: "sessions#welcome" 


  root(to: "static#home")
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end