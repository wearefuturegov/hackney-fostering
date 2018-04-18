class AreYouReligiousRule < ApplicationRule
  
  def process
    @next_step = params[:application][:religious] == 'true' ? :what_is_your_religion : :welcome_working
  end
  
end
