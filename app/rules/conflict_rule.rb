class ConflictRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = if application.pets.count == application.number_of_pets
                  application_you_and_your_family_path(application_id: application.id, id: :breed_pets)
                else
                  new_application_pet_path(application_id: application.id)
                end
  end
  
  def application
    @application ||= Application.friendly.find(params[:application_id])
  end
end
