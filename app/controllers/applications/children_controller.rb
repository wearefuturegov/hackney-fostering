module Applications
  class ChildrenController < MainController
    expose :application
    
    def new
      child = application.children.build
      redirect_to new_application_child_information_path(application_id: application.id, child_id: child.id) if application.save
    end
    
  end
end
