class PetsRule < ApplicationRule
  def process
    @redirect = new_application_referee_path(application_id: application.code)
  end
end
