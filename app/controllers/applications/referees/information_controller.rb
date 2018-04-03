module Applications
  module Referees
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.referees.find(params[:referee_id]) }
      
      form 'referees'
      
      def update_person
        @valid = person.update_attributes(permitted_params) if params[:referee]
      end
      
      private
      
      def permitted_params
        params.require(:referee).permit(
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
