class ApplicationsController < MainController
  expose :application
  
  def create
    redirect_to new_application_form_path(application_id: application.id) if application.save
  end
  
end
