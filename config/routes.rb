Rails.application.routes.draw do

  resources :what, only: [:index]
  resources :why, only: [:index]
  resources :who, only: [:index]
  resources :legibility, only: [:index]
  resources :contact, only: [:index]

  get '/', to: 'application#index'
  
  
  resources :foster_checks do
    resources :form, controller: 'foster_checks/form'
  end
end
