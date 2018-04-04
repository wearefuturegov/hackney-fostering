module Applications
  class RefereesController < PeopleController
    expose :referee, -> { application.referees.create }
    
    def index; end

    def path
      if params[:step]
        application_referee_information_path(application_id: application.code, referee_id: referee.id, id: params[:step])
      else
        new_application_referee_information_path(application_id: application.code, referee_id: referee.id)
      end
    end
  end
end
