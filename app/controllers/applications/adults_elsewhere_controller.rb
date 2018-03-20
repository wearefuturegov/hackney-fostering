module Applications
  class AdultsElsewhereController < PeopleController
    expose :adult, -> { application.adults_elsewhere.create }

    def path
      new_application_adults_elsewhere_information_path(application_id: application.id, adults_elsewhere_id: adult.id)
    end
  end
end
