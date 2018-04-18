class SupportCarerEmailRule < ApplicationRule
  def process
    @redirect = application_referees_path(application_id: application.code)
  end
end
