class ChildrenLivingElsewhereRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @next_step = :adults_living_at_home if params['application']['children_living_elsewhere'] == '0'
    path = new_application_children_elsewhere_path(application_id: application.id)
    @redirect = path if params['application']['children_living_elsewhere'] == '1'
  end
  
  def application
    Application.find(params[:application_id])
  end
end
