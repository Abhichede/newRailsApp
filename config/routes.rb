Rails.application.routes.draw do
  resources :booking_details
  resources :flats
  resources :sites
  devise_for :users
  root 'sites#index'
  get 'update_paid_amount', to: 'booking_details#update_paid_amount'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
