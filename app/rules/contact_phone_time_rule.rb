class ContactPhoneTimeRule < ApplicationRule
  def process
    SetupApplicationJob.enqueue(application.id)
  end
end
