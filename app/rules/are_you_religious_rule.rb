class AreYouReligiousRule < ApplicationRule
  
  def process
    @next_step = params[:application][:religious] == '1' ? :what_is_your_religion : :welcome_working
  end
  
end
