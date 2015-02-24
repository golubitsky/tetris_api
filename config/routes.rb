Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: :create do
      resources :games, only: [:create]
    end
    resources :games, only: :index
  end
end
