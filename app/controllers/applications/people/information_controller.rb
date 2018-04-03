module Applications
  module People
    class InformationController < MainController
      include Incredible::Wizard
      expose :application, -> { Application.friendly.find(params[:application_id]) }
      expose :person, -> { application.people.find(params[:person_id]) }
      
      prepend_before_action :update_person, only: :update
      skip_before_action :load_next_step, unless: :valid?
      
      def show
        render_wizard nil, template: "people/#{template}"
      end
      
      def update
        if person.valid?
          render_wizard person
        else
          render "people/#{template}"
        end
      end
      
      def new
        redirect_to wizard_path(steps.first, person_id: person.id)
      end
      
      private
      
      def update_person
        @valid = person.update_attributes(permitted_params)
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
