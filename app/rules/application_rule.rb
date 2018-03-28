class ApplicationRule < Incredible::Rule
  include Rails.application.routes.url_helpers
  
  def application
    @application ||= Application.friendly.find(params[:application_id])
  end
end
