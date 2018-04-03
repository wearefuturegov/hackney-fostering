class PreviousFosteringRule < ApplicationRule
  def process
    @redirect = new_application_confirmation_path(application_id: application.code) unless previous_fostering?
    @next_step = :previous_agency_name if previous_fostering?
  end
  
  def previous_fostering?
    params[:application][:previous_fostering] == '1'
  end
end
