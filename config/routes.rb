Rails.application.routes.draw do

  devise_for :users
  root to: "welcome#index"

  resources :breweries

  resources :breweries do
    resources :reviews, only: [:create,:new]
  end

end
