Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"

  resources :games do
    resources :locations, except: %i[index]
    resources :characters
  end
  resources :users
end
