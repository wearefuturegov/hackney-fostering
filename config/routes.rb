Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  resources :applications do
    collection { get :find }
    resources :eligibility, controller: 'applications/eligibility'
    resources :you_and_your_family, controller: 'applications/you_and_your_family'
    resources :legal_history, controller: 'applications/legal_history'
    resources :addresses, controller: 'applications/addresses'
    resources :support_carer, controller: 'applications/support_carer'
    resources :children, controller: 'applications/children', only: %i[new] do
      resources :information, controller: 'applications/children/information'
    end
    resources :children_elsewhere, controller: 'applications/children_elsewhere', only: %i[new] do
      resources :information, controller: 'applications/children_elsewhere/information'
    end
    resources :adults, controller: 'applications/adults', only: %i[new] do
      resources :information, controller: 'applications/adults/information'
    end
    resources :adults_elsewhere, controller: 'applications/adults_elsewhere', only: %i[new] do
      resources :information, controller: 'applications/adults_elsewhere/information'
    end
    resources :pets, controller: 'applications/pets', only: %i[new] do
      resources :information, controller: 'applications/pets/information'
    end
    resources :referees, controller: 'applications/referees', only: %i[new] do
      resources :information, controller: 'applications/referees/information'
    end
    resources :confirmations, controller: 'applications/confirmations'
  end
  
  resources :pages, only: [:show], path: '/'
  get '/', to: 'pages#show', id: 'fostering'
end
