class OtherLanguageRule < ApplicationRule
  
  def process
    @next_step = params[:application][:other_language] == 'true' ? :other_language_select : :are_you_religious
  end
  
end
