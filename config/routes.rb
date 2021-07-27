Rails.application.routes.draw do

  get '/search_entries', to: 'entries#index'

  resources :users do
    resources :entries
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
