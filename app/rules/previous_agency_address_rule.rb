class PreviousAgencyAddressRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = consent_application_path(application)
  end
  
  def application
    Application.friendly.find(params[:application_id])
  end
end
