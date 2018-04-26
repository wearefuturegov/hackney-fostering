class PetsRule < ApplicationRule
  def process
    @redirect = new_applications_support_carer_path
  end
end
