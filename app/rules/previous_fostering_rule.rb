class PreviousFosteringRule < ApplicationRule
  def process
    @redirect = consent_application_path(application) if params[:application][:previous_fostering] == '0'
    @next_step = :previous_agency_name if params[:application][:previous_fostering] == '1'
  end
end
