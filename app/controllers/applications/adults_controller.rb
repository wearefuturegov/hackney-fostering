module Applications
  class AdultsController < MainController
    expose :application
    
    def new
      adult = application.adults.create
      path = new_application_adult_information_path(application_id: application.id, adult_id: adult.id)
      redirect_to path
    end
    
  end
end
