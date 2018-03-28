class PreviousAgencyAddressRule < ApplicationRule
  def process
    @redirect = consent_application_path(application)
  end
end
