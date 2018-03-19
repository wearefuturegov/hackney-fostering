class ApplicationsController < MainController
  expose :application
  
  prepend_before_action :update_application
  
  def show
    render_wizard nil, template: "applications/#{template}"
  end
  
  def update
    render_wizard application
  end
  
  def new
    redirect_to wizard_path(steps.first, application_id: application.id)
  end
  
  def create
    redirect_to new_application_eligibility_path(application_id: application.id) if application.save
  end
  
  private
  
  def update_application
    application.update_attributes(permitted_params) if params[:application]
  end
  
end
