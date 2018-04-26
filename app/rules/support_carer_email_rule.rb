class SupportCarerEmailRule < ApplicationRule
  def process
    @redirect = intro_applications_referees_path
  end
end
