module Applications
  class AdultsController < PeopleController
    expose :application
    expose :adult, -> { application.adults.create }
    
    def path
      new_application_adult_information_path(application_id: application.id, adult_id: adult.id)
    end
  end
end
