module Applications
  class ConfirmationsController < ApplicationsController
    
    def new
      application.update_attribute(:current_step, 'consent')
    end
    
    def create
      if valid?
        application.send_full_application_email!
        flash[:notice] = 'Your application has been sent. You will hear from us in the next 5 - 10 working days'
        redirect_to page_path(id: 'fostering')
      else
        render 'new'
      end
    end
    
    private
    
    def permitted_params
      params.require(:application).permit(
        :agree_to_checks, :agree_to_la_contact, :signature
      )
    end
    
  end
end
