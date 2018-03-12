class ContactingYouRule < Incredible::Rule
  
  def process
    @next_step = case params[:application][:contacting_you]
                 when 'contact_phone'
                   :contact_phone
                 when 'contact_email'
                   :contact_email
                 when 'contact_either'
                   :contact_either
                 end
  end
  
end
