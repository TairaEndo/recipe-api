Rails.application.routes.draw do
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # root to: '/'
  # get "recipies"
  # get "recipies/:id"
  # post "recipies"
  # patch "recipies/:id"

end


# rails g scaffold Recipe id:integer title:string making_time:string serves:string ingredients:string cost:integer created_at:datetime updated_at:datetime