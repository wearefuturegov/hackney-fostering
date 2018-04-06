module Applications
  class AdultsController < PeopleController
    expose :person, model: 'Adult', build: -> { application.adults.new(person_params) }
    
    def form_id
      :adults_living_at_home
    end
    
    def template
      'applications/adults'
    end
    
    private
    
    def person_params
      params.require(:adult).permit(
        :first_name,
        :last_name,
        :gender,
        :date_of_birth,
        :relationship
      )
    end
    
    def step
      'adults_living_at_home'
    end
  end
end
