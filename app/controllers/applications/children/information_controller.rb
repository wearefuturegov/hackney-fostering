module Applications
  module Children
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.children.find(params[:child_id]) }
      
      form 'children'
      
      private
      
      def permitted_params
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
    end
  end
end
