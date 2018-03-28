class ReferenceRelationshipRule < ApplicationRule
  def process
    @redirect = if application.referees.count < 6
                  new_application_referee_path(application_id: application.code, step: :name)
                else
                  new_application_support_carer_path(application_id: application.code)
                end
  end
end
