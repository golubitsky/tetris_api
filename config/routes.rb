Rails.application.routes.draw do
  root 'api/games#index', defaults: { format: :json }

  namespace :api, defaults: { format: :json } do
    resources :games, only: [:create, :index]
  end
end
