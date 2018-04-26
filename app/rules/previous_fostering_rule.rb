class PreviousFosteringRule < ApplicationRule
  def process
    @redirect = new_applications_confirmation_path unless previous_fostering?
    @next_step = :previous_agency_name if previous_fostering?
  end
  
  def previous_fostering?
    params[:application][:previous_fostering] == 'true'
  end
end
