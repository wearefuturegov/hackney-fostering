Rails.application.routes.draw do
  get '/', to: 'application#index', as: 'application_index'
  
  resources :foster_checks do
    resources :form, controller: 'foster_checks/form'
  end
end
