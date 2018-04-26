module Applications
  class PeopleController < MainController
    expose :application, -> { current_user_login.application }
    before_action :load_questions
    
    before_action :authenticate_user_login!
    
    layout 'main_application'

    def edit
      render :edit
    end
    
    def update
      if person.update(person_params)
        redirect_to applications_you_and_your_family_path(id: form_id)
      else
        application.reload
        render template
      end
    end
    
    def create
      if person.save
        redirect_to applications_you_and_your_family_path(id: form_id)
      else
        application.reload
        render template
      end
    end
    
    def destroy
      person.destroy
      redirect_to applications_you_and_your_family_path(id: form_id)
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
