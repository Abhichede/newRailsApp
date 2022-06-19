Rails.application.routes.draw do

  resources :partner_payments
  resources :partners
  resources :users, only: %i[index] do
    get :toggle_user_status, on: :member, format: :json
  end


  resources :investors
  resources :office_expences
  resources :contractors do
    resources :contractor_documents, only: %i[create update show index new edit]
  end
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
    resources :customer_documents, only: %i[create update show index new edit]
  end
  resources :flats
  resources :sites do
    get :print_all_customer_details, on: :member
    get :print_all_supplier_details, on: :member
  end
  resource :payment_details
  resource :investments
  resource :material_list
  devise_for :users, :controllers => {registrations: 'registrations', sessions: 'sessions'}
  root 'sites#index'
  get 'show_site_material', to: 'sites#show_site_material'
  get 'show_departmental_labours', to: 'departmental_labours#show_departmental_labours'
  get 'show_supplier_wise_material', to: 'sites#show_supplier_wise_material'
  get 'update_supplier_payment', to: 'suppliers#update_supplier_payment'
  get 'edit_supplier_payment', to: 'suppliers#edit_supplier_payment'
  get 'destroy_supplier_payment', to: 'suppliers#destroy_supplier_payment'
  get 'show_payment_details', to: 'payment_details#show'
  get 'destroy_payment', to: 'payment_details#show'
  get 'update_paid_amount', to: 'booking_details#update_paid_amount'
  get 'edit_bookings_payment_details', to: 'booking_details#edit_bookings_payment_details'
  get 'search_booking_details', to: 'booking_details#search'
  get 'schedule_next_installment', to: 'booking_details#schedule_next_installment'
  get 'show_contractual_labours', to: 'contractual_labours#show_contractual_labours'
  get 'update_contractual_labour_payment', to: 'contractual_labours#update_contractual_labour_payment'
  get 'edit_contractual_labour_payment', to: 'contractual_labours#edit_contractual_labour_payment'
  get 'contractual_labour_payment_details', to: 'contractual_labours#contractual_labour_payment_details'
  get 'destroy_contractual_labour_payment', to: 'contractual_labours#destroy_contractual_labour_payment'

  post 'investment_returns', to: 'investors#investment_return'
  get 'investment_details', to: 'investments#investment_details'
  get 'investment_payment_details', to: 'investments#investment_payment_details'
  get 'destroy_investment', to: 'investors#destroy_investment'

  get 'update_material_rate', to: 'materials#update_material_rates'

  get 'update_departmental_labour_payment', to: 'departmental_labours#update_departmental_labour_payment'
  get 'edit_departmental_labour_payment', to: 'departmental_labours#edit_departmental_labour_payment'
  get 'destroy_departmental_labour_payment', to: 'departmental_labours#destroy_departmental_labour_payment'
  get 'departmental_labour_payment_details', to: 'departmental_labours#departmental_labour_payment_details'

  get 'simple', to: 'simple#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
