class AreYouPracticingRule
  
  def self.process(params)
    params[:practicing] == 'practicing' ? :what_do_you_practice : :language
  end
  
end
