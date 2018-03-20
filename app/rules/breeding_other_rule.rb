class BreedingOtherRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = new_application_legal_history_path(application_id: application.id)
  end
  
  def application
    Application.friendly.find(params[:application_id])
  end
  
end
