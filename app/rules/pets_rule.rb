class PetsRule < ApplicationRule
  def process
    @next_step = :breed_pets if params['application']['have_pets'] == '0'
    @redirect = new_application_pet_path(application_id: application.id) if params['application']['have_pets'] == '1'
  end
end
