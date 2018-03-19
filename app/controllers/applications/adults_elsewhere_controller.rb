module Applications
  class AdultsElsewhereController < MainController
    expose :application
    
    def new
      adult = application.adults_elsewhere.create
      path = new_application_adults_elsewhere_information_path(application_id: application.id, adults_elsewhere_id: adult.id)
      redirect_to path
    end
    
  end
end
