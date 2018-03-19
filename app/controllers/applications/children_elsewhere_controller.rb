module Applications
  class ChildrenElsewhereController < MainController
    expose :application
    
    def new
      child = application.children_elsewhere.create
      path = new_application_children_elsewhere_information_path(application_id: application.id, children_elsewhere_id: child.id)
      redirect_to path
    end
    
  end
end
