module Applications
  class PeopleController < MainController
    layout "main_application"

    expose :application, -> { Application.friendly.find(params[:application_id]) }

    def new
      application.update_attribute(:current_step, nil)
      redirect_to path
    end

  end
end
