class ReferenceRelationshipRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = if application.referees.count < 6
                  new_application_referee_path(application_id: application.code, step: :name)
                else
                  new_application_support_carer_path(application_id: application.code)
                end
  end
  
  def application
    @application ||= Application.friendly.find(params[:application_id])
  end
end
