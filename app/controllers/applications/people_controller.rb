module Applications
  class PeopleController < MainController
    expose :application, -> { Application.friendly.find(params[:application_id]) }
    before_action :load_questions
    
    before_action :authenticate_user_login!
    append_before_action :check_application!
    
    layout 'main_application'

    def edit
      render :edit
    end
    
    def update
      if person.update(person_params)
        redirect_to application_you_and_your_family_path(application_id: application.code, id: form_id)
      else
        application.reload
        render template
      end
    end
    
    def create
      if person.save
        redirect_to application_you_and_your_family_path(application_id: application.code, id: form_id)
      else
        application.reload
        render template
      end
    end
    
    def destroy
      person.destroy
      redirect_to application_you_and_your_family_path(application_id: application.code, id: form_id)
    end
    
    private
    
    def load_questions
      @questions = form.find_step(step).questions
    end
    
    def form
      Incredible::Form.new('you_and_your_family')
    end
    
  end
end
