module Applications
  class PeopleController < MainController
    expose :application, -> { Application.friendly.find(params[:application_id]) }
    
    def new
      redirect_to path
    end
    
  end
end
