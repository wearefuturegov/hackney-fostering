class BeInTouchRule
  
  def self.process(params)
    params[:application][:be_in_touch] == 'contact_me' ? :what_is_your_name : :thank_you
  end
  
end
