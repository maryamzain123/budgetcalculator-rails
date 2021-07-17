Rails.application.routes.draw do


  resources :users do
    resources :entries
    resources :categories, only: [:index, :show]
  end

  # resources :categories do 
  #   resources :entries
  # end
  


  # get '/user/:user_id/entries/month', to: "entries#month", as: "month"
  # # get '/user/:user_id/entries/usercategory', to: "entries#usercategory", as: "usercategory"


  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get 'welcome', to: "sessions#welcome" 






  root(to: "static#home")
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
