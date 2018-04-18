class FamilyCourtRule < ApplicationRule
  def process
    @next_step = params[:application][:family_court] == 'true' ? :court_date : :previous_applications
  end
end
