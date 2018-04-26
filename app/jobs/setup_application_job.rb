class SetupApplicationJob < Que::Job
  def run(application_id)
    application = Application.find(application_id)

    ActiveRecord::Base.transaction do
      application.applicant.create_user_login! if application.eligible?
      ApplicationsMailer.eligibility(application_id).deliver
      destroy
    end
  end
end
