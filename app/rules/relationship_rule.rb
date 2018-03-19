class RelationshipRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = if params['controller'] == 'applications/adults/information'
                  adults_redirect
                end
  end
  
  def adults_redirect
    if application.adults.count == application.number_of_adults
      application_full_application_path(application_id: application.id, id: :adults_living_elsewhere)
    else
      new_application_adult_path(application_id: application.id)
    end
  end
  
  def application
    @application ||= Application.find(params[:application_id])
  end
  
end
