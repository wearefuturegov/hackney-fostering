class SupportCarerEmailRule < ApplicationRule
  def process
    @redirect = new_application_legal_history_path(application_id: application.code)
  end
end
