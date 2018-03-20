class PreviousApplicationsRule < Incredible::Rule
  def process
    @next_step = params[:application][:previous_applications] == '1' ? :application_date : :other_previous_applications
  end
end
