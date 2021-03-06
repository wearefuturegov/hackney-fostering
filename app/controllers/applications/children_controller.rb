module Applications
  class ChildrenController < PeopleController
    expose :person, model: 'Child', build: -> { application.children.new(person_params) }
    
    def form_id
      :children_living_at_home
    end
    
    def template
      'applications/children'
    end
    
    private
    
    def person_params
      params.require(:child).permit(
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
      'children_living_at_home'
    end
    
  end
end
