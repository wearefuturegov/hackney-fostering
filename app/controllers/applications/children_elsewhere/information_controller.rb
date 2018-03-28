module Applications
  module ChildrenElsewhere
    class InformationController < Applications::People::InformationController
      include Incredible::Wizard
      expose :person, -> { application.children_elsewhere.find(params[:children_elsewhere_id]) }
      
      form 'children'
      
      private
      
      def permitted_params
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
    end
  end
end
