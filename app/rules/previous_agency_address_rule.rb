class PreviousAgencyAddressRule < ApplicationRule
  def process
    @redirect = new_application_confirmation_path(application_id: application.code)
  end
end
