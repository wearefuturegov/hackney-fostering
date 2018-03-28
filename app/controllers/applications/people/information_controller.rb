module Applications
  module People
    class InformationController < MainController
      include Incredible::Wizard
      expose :application, -> { Application.friendly.find(params[:application_id]) }
      expose :person, -> { application.people.find(params[:person_id]) }
      
      prepend_before_action :update_person, only: :update
      
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
        person.update_attributes(permitted_params)
      end
      
      def permitted_params
        params.require(:person).permit(
          :first_name,
          :last_name,
          :gender,
          :date_of_birth,
          :relationship,
          :years_known,
          :school,
          :school_contact,
          :email,
          :phone_number,
          address_attributes: %i[line_1 line_2 line_3 post_town postcode]
        )
      end
    end
  end
end
