class AdultsLivingElsewhereRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @next_step = :pets if adults_living_elsewhere == '0'
    @redirect = new_application_adults_elsewhere_path(application_id: application.id) if adults_living_elsewhere == '1'
  end
  
  def adults_living_elsewhere
    params['application']['adults_living_elsewhere']
  end
  
  def application
    Application.find(params[:application_id])
  end
end
