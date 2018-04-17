class PreviousApplicationsRule < ApplicationRule
  def process
    @next_step = params[:application][:previous_applications] == 'true' ? :application_date : :other_previous_applications
  end
end
