module Applications
  module Children
    class InformationController < MainController
      include Incredible::Wizard
      expose :application
      expose :child, -> { application.children.find(params[:child_id]) }
      
      prepend_before_action :update_child

      form 'children'
      
      def show
        render_wizard nil, template: "children/#{template}"
      end
      
      def update
        render_wizard child
      end
      
      def new
        redirect_to wizard_path(steps.first, child_id: child.id)
      end
      
      private
      
      def update_child
        child.update_attributes(permitted_params) if params[:person]
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
