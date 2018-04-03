module Applications
  class ChildrenController < PeopleController
    expose :child, -> { application.children.create }

    def path
      new_application_child_information_path(application_id: application.code, child_id: child.id)
    end
  end
end
