class PreviousAgencyAddressRule < ApplicationRule
  def process
    @redirect = new_applications_confirmation_path
  end
end
