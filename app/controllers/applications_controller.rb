class ApplicationsController < MainController
  expose :application
  
  def create
    redirect_to new_application_eligibility_path(application_id: application.id) if application.save
  end
  
end
