module Applications
  class AdultsController < PeopleController
    expose :adult, -> { application.adults.create }
    
    def path
      new_application_adult_information_path(application_id: application.code, adult_id: adult.id)
    end
  end
end
