class SupportCarerEmailRule < ApplicationRule
  def process
    @redirect = intro_application_referees_path(application_id: application.code)
  end
end
