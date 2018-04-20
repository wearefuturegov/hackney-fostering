module UserLogins
  class ConfirmationsController < Devise::ConfirmationsController
    expose :user_login, -> { UserLogin.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token]) }
    
    def update
      user_login.attempt_set_password(params[:user_login])
      user_login.valid? && user_login.password_match? ? do_confirm : do_show
    end
    
    def show
      user_login.no_password? ? do_show : do_confirm
    end
    
    def send_instructions
      user = UserLogin.find_by_confirmation_token(params[:token])
      user.resend_confirmation_instructions
      flash[:notice] = 'An email has been sent to the user with instructions on how to start their application'
      redirect_to '/'
    end
    
    protected

    def do_show
      @confirmation_token = params[:confirmation_token]
      render 'devise/confirmations/show'
    end

    def do_confirm
      user_login.confirm
      set_flash_message :notice, :confirmed
      sign_in(user_login, scope: :user_login)
      redirect_to new_application_you_and_your_family_path(user_login.user.application)
    end
    
  end
end
