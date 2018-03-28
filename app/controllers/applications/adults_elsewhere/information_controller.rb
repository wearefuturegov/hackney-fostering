module Applications
  module AdultsElsewhere
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.adults_elsewhere.find(params[:adults_elsewhere_id]) }
      
      form 'adults'
      
      private
      
      def permitted_params
        params.require(:adult_elsewhere).permit(
          :first_name,
          :last_name,
          :gender,
          :date_of_birth,
          :relationship
        )
      end
    end
  end
end
