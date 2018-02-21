  Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :farms do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [ :show, :destroy ]
  get 'bookings/:id/accept', to: 'bookings#accept', as: :accept
  get 'bookings/:id/decline', to: 'bookings#decline', as: :decline
  get 'bookings', to: 'bookings#index'

  resources :profiles, only: [ :show, :edit, :update, :destroy ]
end
