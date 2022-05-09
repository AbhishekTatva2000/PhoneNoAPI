Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :phone
  get '/phone', to: "phone#index"
  post '/phone', to: "phone#create"
  post '/phone/:number', to: "phone#create"  
  # Defines the root path route ("/")
  # root "articles#index"
end
