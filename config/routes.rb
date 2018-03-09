Rails.application.routes.draw do
  resources :what, only: [:index]
  resources :why, only: [:index]
  resources :who, only: [:index]
  resources :eligibility, only: [:index]
  resources :contact, only: [:index]

  get '/', to: 'main#index'
  
  resources :applications do
    resources :eligibility, controller: 'applications/eligibility'
  end
end
