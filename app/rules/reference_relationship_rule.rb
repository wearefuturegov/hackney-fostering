class ReferenceRelationshipRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = new_application_referee_path(application_id: application.id, step: :name) if application.referees.count < 6
  end
  
  def application
    @application ||= Application.friendly.find(params[:application_id])
  end
end
