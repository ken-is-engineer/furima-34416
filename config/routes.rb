Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    member do
      resources :purchases, only: [:index, :create]
      resources :favorites, only: [:index, :create, :destroy]
    end
  end

  resources :users, only: :show do
    #member do
      #resources :favorites, only: :index
    #end
  end
end
