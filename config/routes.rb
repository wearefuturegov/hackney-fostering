Rails.application.routes.draw do
  resources :applications do
    collection { get :find }
    resources :eligibility, controller: 'applications/eligibility'
    resources :you_and_your_family, controller: 'applications/you_and_your_family'
    resources :legal_history, controller: 'applications/legal_history'
    resources :addresses, controller: 'applications/addresses'
    resources :support_carer, controller: 'applications/support_carer'
    resources :children, controller: 'applications/children'
    resources :children_elsewhere, controller: 'applications/children_elsewhere'
    resources :adults, controller: 'applications/adults'
    resources :adults_elsewhere, controller: 'applications/adults_elsewhere'
    resources :referees, controller: 'applications/referees'
    resources :confirmations, controller: 'applications/confirmations'
  end
  
  resources :pages, only: [:show], path: '/'
  get '/', to: 'pages#show', id: 'eligibility'
end
