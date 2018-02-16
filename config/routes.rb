Rails.application.routes.draw do
  resources :foster_checks do
    resources :form, controller: 'foster_checks/form'
  end
end
