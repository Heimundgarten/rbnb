Rails.application.routes.draw do
  root to: 'pages#home'
  # devise_for :users

  resources :boardgames  do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create, :delete]
  end

  resources :users, only: [:show, :edit, :update, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
