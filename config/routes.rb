Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  resources :what, only: [:index]
  resources :why, only: [:index]
  resources :who, only: [:index]
  resources :begin, only: [:index]
  resources :eligibility, only: [:index]
  resources :contact, only: [:index]

  root to: 'main#index'

  resources :applications do
    resources :eligibility, controller: 'applications/eligibility'
    resources :full_application, controller: 'applications/full_application'
    resources :addresses, controller: 'applications/addresses'
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
  end
end
