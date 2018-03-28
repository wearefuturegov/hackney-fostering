class ContactEmailRule < ApplicationRule
  def process
    ApplicationsMailer.eligibility(params[:application_id]).deliver
  end
end
