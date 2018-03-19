class SchoolRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = if params['controller'] == 'applications/children_elsewhere/information'
                  children_elsewhere_redirect
                else
                  children_redirect
                end
  end
  
  def children_redirect
    if application.children.count == application.number_of_children
      application_full_application_path(application_id: application.id, id: :children_living_elsewhere)
    else
      new_application_child_path(application_id: application.id)
    end
  end
  
  def children_elsewhere_redirect
    if application.children_elsewhere.count == application.number_of_children_elsewhere
      application_full_application_path(application_id: application.id, id: :adults_living_at_home)
    else
      new_application_children_elsewhere_path(application_id: application.id)
    end
  end
  
  def application
    @application ||= Application.find(params[:application_id])
  end
end