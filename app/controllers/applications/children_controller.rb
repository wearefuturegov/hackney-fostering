module Applications
  class ChildrenController < MainController
    expose :application
    
    def new
      child = application.children.create
      path = new_application_child_information_path(application_id: application.id, child_id: child.id)
      redirect_to path
    end
    
  end
end
