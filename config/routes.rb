Rails.application.routes.draw do

  devise_for :users
  root to: "breweries#index"

  resources :breweries, only: [:index, :show, :edit, :update]

end
