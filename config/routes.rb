Rails.application.routes.draw do
  root 'jump#index'

  resources :jump, only: [:index]

  resources :spots, only: [:index, :create, :new]

  resources :food_searches

end
