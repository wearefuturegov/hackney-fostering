class AreYouPracticingRule
  
  def self.process(params)
    params[:application][:practicing] == 'practicing' ? :what_do_you_practice : :language
  end
  
end
