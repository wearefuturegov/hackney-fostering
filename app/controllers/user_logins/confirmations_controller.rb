module UserLogins
  class ConfirmationsController < Devise::ConfirmationsController
    def send_instructions
      user = UserLogin.find_by_confirmation_token(params[:token])
      user.resend_confirmation_instructions
      flash[:notice] = 'An email has been sent to the user with instructions on how to start their application'
      redirect_to '/'
    end
  end
end
