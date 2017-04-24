Rails.application.routes.draw do
  resources :booking_details  do
    collection { get :autocomplete }
  end
  resources :flats
  resources :sites
  resource :payment_details
  devise_for :users
  root 'simple#index'
  get 'show_payment_details', to: 'payment_details#show'
  get 'destroy_payment', to: 'payment_details#show'
  get 'update_paid_amount', to: 'booking_details#update_paid_amount'
  get 'search_booking_details', to: 'booking_details#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
