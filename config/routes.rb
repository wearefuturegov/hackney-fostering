Rails.application.routes.draw do

  resources :what, only: [:index]
  resources :why, only: [:index]
  resources :who, only: [:index]
  resources :legibility, only: [:index]
  resources :contact, only: [:index]

  get '/', to: 'main#index'
  
  resources :applications do
    resources :form, controller: 'applications/form'
  end
end
