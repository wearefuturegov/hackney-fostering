module Applications
  module People
    class InformationController < MainController
      include Incredible::Wizard
      expose :application, -> { Application.friendly.find(params[:application_id]) }
      expose :person, -> { application.people.find(params[:person_id]) }
      
      prepend_before_action :update_person
      
      def show
        render_wizard nil, template: "people/#{template}"
      end
      
      def update
        render_wizard person
      end
      
      def new
        redirect_to wizard_path(steps.first, person_id: person.id)
      end
      
      private
      
      def update_person
        person.update_attributes(permitted_params) if params[:person]
      end
      
      def permitted_params
        params.require(:person).permit(
          :first_name,
          :last_name,
          :gender,
          :date_of_birth,
          :relationship,
          :school,
          :school_contact
        )
      end
    end
  end
end
