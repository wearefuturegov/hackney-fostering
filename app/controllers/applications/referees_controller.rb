module Applications
  class RefereesController < MainController # rubocop:disable Metrics/ClassLength
    expose :application, -> { Application.friendly.find(params[:application_id]) }
    expose :referee, model: 'Referee', build: -> { application.referees.new }
    expose :referees, -> { application.referees }
    
    before_action :load_questions
    
    def index; end
        
    def edit; end
    
    def update
      if referee.update_attributes(referee_params)
        redirect_to application_referees_path(application_id: application.code)
      else
        render :edit
      end
    end
    
    def create
      if referee.update_attributes(referee_params)
        redirect_to application_referees_path(application_id: application.code)
      else
        render :index
      end
    end
    
    def destroy
      referee.destroy
      redirect_to application_referees_path(application_id: application.code)
    end
    
    private
    
    def referee_params
      params.require(:referee).permit(
        :first_name,
        :last_name,
        :email,
        :phone_number,
        :relationship,
        :years_known,
        :line_1,
        :line_2,
        :line_3,
        :post_town,
        :postcode
      )
    end
    
    def load_questions # rubocop:disable Metrics/MethodLength
      @questions = [
        {
          'name' => :first_name,
          'title' => 'First name(s)',
          'widget' => :input
        },
        {
          'name' => :last_name,
          'title' => 'Last name',
          'widget' => :input
        },
        {
          'name' => :section,
          'title' => 'Address',
          'widget' => :title
        },
        {
          'name' => :address,
          'title' => 'Address',
          'widget' => :address,
          'questions' => address_questions
        },
        {
          'name' => :email,
          'widget' => :email,
          'title' => 'Email'
        },
        {
          'name' => :phone_number,
          'title' => 'Phone Number',
          'widget' => :input
        },
        {
          'name' => :relationship,
          'title' => 'Relationship to you',
          'widget' => :select
        },
        {
          'name' => :years_known,
          'title' => 'How many years have you known each other?',
          'widget' => :input
        }
      ]
    end
    
    def address_questions # rubocop:disable Metrics/MethodLength
      [
        {
          'name' => :line_1,
          'title' => 'Address Line 1',
          'widget' => :input
        },
        {
          'name' => :line_2,
          'title' => 'Address Line 2',
          'widget' => :input
        },
        {
          'name' => :line_3,
          'title' => 'Address Line 3',
          'widget' => :input
        },
        {
          'name' => :post_town,
          'title' => 'Address Line 4',
          'widget' => :input
        },
        {
          'name' => :postcode,
          'title' => 'Postcode',
          'widget' => :input
        }
      ]
    end
    
    def set_current_step
      application.update_attribute(:current_step, 'referees')
    end
    
  end
end
