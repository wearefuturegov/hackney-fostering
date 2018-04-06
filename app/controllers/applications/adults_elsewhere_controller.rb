module Applications
  class AdultsElsewhereController < PeopleController
    expose :person, model: 'AdultElsewhere', build: -> { application.adults_elsewhere.new(person_params) }
    
    def form_id
      :adults_living_elsewhere
    end
    
    def template
      'applications/adults_elsewhere'
    end
    
    private
    
    def person_params
      params.require(:adult_elsewhere).permit(
        :first_name,
        :last_name,
        :gender,
        :date_of_birth,
        :relationship
      )
    end
    
    def step
      'adults_living_elsewhere'
    end
  end
end
