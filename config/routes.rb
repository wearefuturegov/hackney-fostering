Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  as :user_login do
    patch '/user/confirmation' => 'user_logins/confirmations#update', via: :patch, as: :update_user_confirmation
  end
  devise_for :user_logins, controllers: { confirmations: 'user_logins/confirmations' }
  devise_scope :user_login do
    get ':token/send_instuctions', to: 'user_logins/confirmations#send_instructions', as: 'send_instructions'
    get '/user_logins/sign_out', to: 'devise/sessions#destroy'
    get '/', to: 'devise/sessions#new'
  end
  resources :applications do
    resources :eligibility, controller: 'applications/eligibility'
    resources :you_and_your_family, controller: 'applications/you_and_your_family'
    resources :legal_history, controller: 'applications/legal_history'
    resources :addresses, controller: 'applications/addresses'
    resources :support_carer, controller: 'applications/support_carer'
    resources :children, controller: 'applications/children'
    resources :children_elsewhere, controller: 'applications/children_elsewhere'
    resources :adults, controller: 'applications/adults'
    resources :adults_elsewhere, controller: 'applications/adults_elsewhere'
    resources :referees, controller: 'applications/referees' do
      collection do
        get 'intro'
      end
    end
    resources :confirmations, controller: 'applications/confirmations'
  end
  
  resources :pages, only: [:show], path: '/'
end
