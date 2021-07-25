Rails.application.routes.draw do


  resources :users do
    resources :entries
    resources :categories, only: [:index, :show]
  end

  

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get 'welcome', to: "sessions#welcome" 


  root(to: "static#home")
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
