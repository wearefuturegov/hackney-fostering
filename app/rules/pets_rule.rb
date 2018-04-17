class PetsRule < ApplicationRule
  def process
    @redirect = new_application_support_carer_path(application_id: application.code)
  end
end
