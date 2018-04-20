class ContactingYouRule < ApplicationRule
  
  def process
    @next_step = case params[:application][:contacting_you]
                 when 'contact_phone'
                   :contact_phone
                 when 'contact_email'
                   SetupApplicationJob.enqueue(params[:application_id])
                   :thank_you
                 end
  end
  
end
