class AdultsLivingAtHomeRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @next_step = :adults_living_elsewhere if adults_living_at_home == '0'
    @redirect = new_application_adult_path(application_id: application.id) if adults_living_at_home == '1'
  end
  
  def adults_living_at_home
    params['application']['adults_living_at_home']
  end
  
  def application
    Application.find(params[:application_id])
  end
end
