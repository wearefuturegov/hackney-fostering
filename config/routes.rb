Rails.application.routes.draw do
  resources :what, only: [:index]
  resources :why, only: [:index]
  resources :who, only: [:index]
  resources :eligibility, only: [:index]
  resources :contact, only: [:index]

  get '/', to: 'main#index'
  
  resources :applications do
    resources :eligibility, controller: 'applications/eligibility'
    resources :full_application, controller: 'applications/full_application'
    resources :addresses, controller: 'applications/addresses'
    resources :children, controller: 'applications/children', only: %i[new] do
      resources :information, controller: 'applications/children/information'
    end
  end
end
