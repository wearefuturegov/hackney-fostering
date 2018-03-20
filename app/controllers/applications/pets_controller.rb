module Applications
  class PetsController < MainController
    expose :application, -> { Application.friendly.find(params[:application_id]) }
    expose :pet, -> { application.pets.create }
    
    def new
      path = new_application_pet_information_path(application_id: application.id, pet_id: pet.id)
      redirect_to path
    end
  end
end