class ContactEmailRule < Incredible::Rule
  def process
    ApplicationsMailer.eligibility(params[:application_id]).deliver
  end
end
