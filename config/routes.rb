Rails.application.routes.draw do
  get 'bookings/create'

  get 'bookings/new'

  get 'bookings/edit'

  get 'bookings/show'

  get 'bookings/update'

  get 'bookings/destroy'

  devise_for :users
  root to: 'pages#home'
  resources :farms do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [ :show, :edit, :update, :destroy ]
end
