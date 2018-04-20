class ContactPhoneTimeRule < ApplicationRule
  def process
    SetupApplicationJob.enqueue(params[:application_id])
  end
end
