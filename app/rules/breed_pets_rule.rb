class BreedPetsRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @next_step = :where_breed_pets if params[:application][:breed_pets] == '1'
    @redirect = new_application_legal_history_path(application_id: application.id) if params[:application][:breed_pets] == '0'
  end
  
  def application
    Application.friendly.find(params[:application_id])
  end
  
end
