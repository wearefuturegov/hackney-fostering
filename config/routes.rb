Rails.application.routes.draw do
  get '/', to: 'application#index'
  
  
  resources :foster_checks do
    resources :form, controller: 'foster_checks/form'
  end
end
