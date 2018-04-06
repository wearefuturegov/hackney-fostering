module Applications
  class ChildrenElsewhereController < PeopleController
    expose :person, model: 'Child', build: -> { application.children_elsewhere.new(person_params) }
    
    def form_id
      :children_living_elsewhere
    end
    
    def template
      'applications/children_elsewhere'
    end
    
    private
    
    def person_params
      params.require(:child_elsewhere).permit(
        :first_name,
        :last_name,
        :gender,
        :date_of_birth,
        :relationship,
        :school,
        :school_contact
      )
    end
    
    def step
      'children_living_elsewhere'
    end
    
  end
end
