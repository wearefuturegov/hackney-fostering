class OtherPreviousApplicationsRule < ApplicationRule
  def process
    @next_step = params[:application][:other_previous_applications] == 'true' ? :other_application_date : :previous_fostering
  end
end
