module Applications
  module Children
    class InformationController < MainController
      include Incredible::Wizard
      expose :application
      expose :child

      form 'children'
      
      def show
        render_wizard nil, template: "shared/#{template}"
      end
      
      def update
        child.update_attributes(permitted_params) if params[:child]
        render_wizard child
      end
      
      def new
        redirect_to wizard_path(steps.first, application_id: child.id)
      end
    end
  end
end
