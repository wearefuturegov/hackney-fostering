class AreYouPracticingRule < Incredible::Rule
  
  def process
    @next_step = params[:application][:practicing] == 'practicing' ? :what_do_you_practice : :language
  end
  
end
