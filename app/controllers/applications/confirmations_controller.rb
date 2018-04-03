module Applications
  class ConfirmationsController < ApplicationsController
    
    def new
      application.update_attribute(:current_step, 'consent')
    end
    
    def create
      application.send_full_application_email!
      flash[:notice] = 'Your application has been sent. You will hear from us in the next 5 - 10 working days'
      redirect_to page_path(id: 'fostering')
    end
    
  end
end
