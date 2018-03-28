module Applications
  module Adults
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.adults.find(params[:adult_id]) }
      
      form 'adults'
      
      private
      
      def permitted_params
        params.require(:adult).permit(
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
