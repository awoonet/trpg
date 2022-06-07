Rails.application.routes.draw do # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  match "/404", to: "errors#not_found", via: :all
  match "/406", to: "errors#unacceptable", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  
  get  'login',  to: "user_sessions#new"
  post 'login',  to: "user_sessions#create"
  get  'logout', to: "user_sessions#destroy"

  root "games#index" # Defines the root path route ("/")

  resources :games do
    resources :locations, except: %i[index] do
      resources :posts, except: %i[index]
    end
    resources :characters
  end
  resources :users do
    resources :characters
  end
end
