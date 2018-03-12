class ApplicationsController < MainController
  expose :application
  
  def show
    render_wizard nil, template: "shared/#{template}"
  end
  
  def update
    application.update_attributes(permitted_params)
    render_wizard application
  end
  
  def new
    redirect_to wizard_path(steps.first, application_id: application.id)
  end
  
  def create
    redirect_to new_application_eligibility_path(application_id: application.id) if application.save
  end
  
end
