class ContactingYouRule
  
  def self.process(params)
    case params[:application][:contacting_you]
    when 'phone'
      :contact_phone
    when 'email'
      :contact_email
    when 'either'
      :contact_either
    end
  end
  
end
