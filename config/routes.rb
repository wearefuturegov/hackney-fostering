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
    
  namespace :applications do
    resources :referees do
      collection do
        get 'intro'
      end
    end
    resources :eligibility
    resources :you_and_your_family
    resources :legal_history
    resources :addresses
    resources :support_carer
    resources :children
    resources :children_elsewhere
    resources :adults
    resources :adults_elsewhere
    resources :confirmations
  end
  
  resources :applications
  resources :pages, only: [:show], path: '/'
end
