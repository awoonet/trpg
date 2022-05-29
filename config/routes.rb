Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  get 'logout', to: "user_sessions#destroy"

  # Defines the root path route ("/")
  root "games#index"

  resources :games do
    resources :locations, except: %i[index]
    resources :characters
  end
  resources :users
end
