class PreviousFosteringRule < Incredible::Rule
  def process
    @next_step = params[:application][:previous_fostering] == '1' ? :previous_agency_name : :dunno
  end
end
