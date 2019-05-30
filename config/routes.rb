Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'boardgames#index'

  resources :boardgames  do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [] do
    resources :reviews, only: [:new]
  end

  resources :reviews, only: [:create, :delete]

  resources :users, only: [:show, :edit, :update, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
