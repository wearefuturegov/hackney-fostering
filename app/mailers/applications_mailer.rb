class ApplicationsMailer < ApplicationMailer
  default to: ENV['FOSTERING_EMAIL_ADDRESS'], from: ENV['FOSTERING_EMAIL_ADDRESS']
  layout 'mailer'
    
  def eligibility(application_id)
    @application = Application.friendly.find(application_id).decorate
    mail(
      subject: 'New eligibility enquiry',
      template_name: template_name
    )
  end
  
  def application(application_id)
    @application = Application.friendly.find(application_id).decorate
    mail(
      subject: 'New fostering application',
      template_name: 'application'
    )
  end
  
  def confirmation(application_id)
    @application = Application.friendly.find(application_id).decorate
    mail(
      subject: 'Your fostering application',
      to: @application.applicant.model.email,
      template_name: 'confirmation'
    )
  end
  
  def template_name
    @application.eligible ? 'eligible' : 'ineligible'
  end
end
