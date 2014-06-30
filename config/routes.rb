Rails.application.routes.draw do

  devise_for :users
  root to: "welcome#index"

  resources :breweries

  resources :breweries do
    resources :reviews do
      resources :votes
    end
  end

  namespace :admin do
    resources :breweries do
      resources :reviews, only: [:edit, :update, :delete, :destroy]
    end
  end
end
