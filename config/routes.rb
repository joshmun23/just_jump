Rails.application.routes.draw do
  devise_for :users
  root 'food_searches#new'
  # resources :jump, only: [:index] # add this back later when adding other portals

  resources :spots, only: [:index, :create, :new]

  resources :food_searches

  resources :users do
    resources :menu_items, only: [:index, :new, :create, :destroy]
  end
end
