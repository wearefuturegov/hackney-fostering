module Applications
  module Children
    class InformationController < MainController
      include Incredible::Wizard
      expose :application
      expose :child, -> { application.children.find(params[:child_id]) }

      form 'children'
      
      def show
        render_wizard nil, template: "children/#{template}"
      end
      
      def update
        child.update_attributes(permitted_params) if params[:child]
        render_wizard child
      end
      
      def new
        redirect_to wizard_path(steps.first, child_id: child.id)
      end
    end
  end
end
