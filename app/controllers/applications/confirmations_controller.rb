module Applications
  class ConfirmationsController < ApplicationsController
    layout 'main_application'

    def new; end

    def create
      if @valid
        application.send_full_application_email!
        flash[:notice] = 'Your application has been sent. You will hear from us in the next 5 - 10 working days'
        render :complete, layout: 'main'
      else
        render :new
      end
    end

    private

    def permitted_params
      params.require(:application).permit(
        :agree_to_checks,
        :agree_to_la_contact,
        :current_step
      )
    end
  end
end
