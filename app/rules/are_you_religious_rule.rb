class AreYouReligiousRule < Incredible::Rule
  
  def process
    @next_step = params[:application][:religious] == '1' ? :what_is_your_religion : :employment_history
  end
  
end
