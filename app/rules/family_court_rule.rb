class FamilyCourtRule < Incredible::Rule
  def process
    @next_step = params[:application][:family_court] == '1' ? :application_date : :previous_applications
  end
end
