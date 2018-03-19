class OtherLanguageRule < Incredible::Rule
  
  def process
    @next_step = params[:application][:other_language] == '1' ? :other_language_select : :are_you_religious
  end
  
end
