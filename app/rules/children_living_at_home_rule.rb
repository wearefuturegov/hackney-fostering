class ChildrenLivingAtHomeRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @next_step = :children_living_elsewhere if params['application']['children_at_home'] == '0'
    @redirect = new_application_child_path(application_id: application.id) if params['application']['children_at_home'] == '1'
  end
  
  def application
    Application.friendly.find(params[:application_id])
  end
end
