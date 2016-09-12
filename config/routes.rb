Rails.application.routes.draw do

  root to: "home#show"
  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :update, :edit]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :update]
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
