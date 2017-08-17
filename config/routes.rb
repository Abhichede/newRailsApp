Rails.application.routes.draw do
  resources :investors
  resources :office_expences
  resources :contractors
  resources :contractual_labours
  resources :departmental_labours
  get 'type_of_structures/index'

  get 'type_of_structures/add'

  get 'contract_list/add'

  get 'contract_list/show'

  resources :materials
  get 'material_list/index'

  get 'material_list/show'

  get 'material_list/add'

  resources :suppliers
  resources :booking_details  do
    collection { get :autocomplete }
  end
  resources :flats
  resources :sites
  resource :payment_details
  resource :investments
  resource :material_list
  devise_for :users, :controllers => {registrations: 'registrations'}
  root 'sites#index'
  get 'show_site_material', to: 'sites#show_site_material'
  get 'show_departmental_labours', to: 'departmental_labours#show_departmental_labours'
  get 'show_supplier_wise_material', to: 'sites#show_supplier_wise_material'
  get 'update_supplier_payment', to: 'suppliers#update_supplier_payment'
  get 'show_payment_details', to: 'payment_details#show'
  get 'destroy_payment', to: 'payment_details#show'
  get 'update_paid_amount', to: 'booking_details#update_paid_amount'
  get 'edit_bookings_payment_details', to: 'booking_details#edit_bookings_payment_details'
  get 'search_booking_details', to: 'booking_details#search'
  get 'schedule_next_installment', to: 'booking_details#schedule_next_installment'
  get 'show_contractual_labours', to: 'contractual_labours#show_contractual_labours'
  get 'update_contractual_labour_payment', to: 'contractual_labours#update_contractual_labour_payment'
  get 'contractual_labour_payment_details', to: 'contractual_labours#contractual_labour_payment_details'

  post 'investment_returns', to: 'investors#investment_return'
  get 'investment_details', to: 'investments#investment_details'
  get 'investment_payment_details', to: 'investments#investment_payment_details'

  get 'update_material_rate', to: 'materials#update_material_rates'

  get 'update_departmental_labour_payment', to: 'departmental_labours#update_departmental_labour_payment'
  get 'departmental_labour_payment_details', to: 'departmental_labours#departmental_labour_payment_details'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
