module Applications
  class ChildrenElsewhereController < PeopleController
    expose :child, -> { application.children_elsewhere.create }

    def path
      new_application_children_elsewhere_information_path(application_id: application.id, children_elsewhere_id: child.id)
    end
  end
end
