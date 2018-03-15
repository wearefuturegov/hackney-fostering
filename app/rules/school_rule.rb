class SchoolRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = if application.children.count == application.number_of_children
                  application_full_application_path(application_id: application.id, id: :children_living_elsewhere)
                else
                  new_application_child_path(application_id: application.id)
                end
  end
  
  def application
    @application ||= Application.find(params[:application_id])
  end
end
