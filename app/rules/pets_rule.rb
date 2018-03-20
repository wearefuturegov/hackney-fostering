class PetsRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @next_step = :breed_pets if params['application']['have_pets'] == '0'
    @redirect = new_application_pet_path(application_id: application.id) if params['application']['have_pets'] == '1'
  end
  
  def application
    Application.friendly.find(params[:application_id])
  end
end
