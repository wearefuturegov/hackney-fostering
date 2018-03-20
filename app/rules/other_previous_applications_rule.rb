class OtherPreviousApplicationsRule < Incredible::Rule
  def process
    @next_step = params[:application][:other_previous_applications] == '1' ? :other_application_date : :previous_fostering
  end
end
