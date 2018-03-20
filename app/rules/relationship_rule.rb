class RelationshipRule < Incredible::Rule
  include Rails.application.routes.url_helpers

  def process
    @redirect = if params['controller'] == 'applications/adults/information'
                  adults_redirect
                elsif params['controller'] == 'applications/adults_elsewhere/information'
                  adults_elsewhere_redirect
                end
  end
  
  def adults_redirect
    if application.adults.count == application.number_of_adults
      application_you_and_your_family_path(application_id: application.id, id: :adults_living_elsewhere)
    else
      new_application_adult_path(application_id: application.id)
    end
  end
  
  def adults_elsewhere_redirect
    if application.adults_elsewhere.count == application.number_of_adults_elsewhere
      application_you_and_your_family_path(application_id: application.id, id: :pets)
    else
      new_application_adults_elsewhere_path(application_id: application.id)
    end
  end
  
  def application
    @application ||= Application.friendly.find(params[:application_id])
  end
  
end
