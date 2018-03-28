class ApplicationsMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'
    
  def eligibility(application_id)
    @application = Application.friendly.find(application_id).decorate
    mail(
      to: ENV['FOSTERING_EMAIL_ADDRESS'],
      from: ENV['FOSTERING_EMAIL_ADDRESS'],
      subject: 'New eligibility enquiry',
      template_name: template_name
    )
  end
  
  def application(application_id)
    @application = Application.friendly.find(application_id).decorate
    mail(
      to: ENV['FOSTERING_EMAIL_ADDRESS'],
      from: ENV['FOSTERING_EMAIL_ADDRESS'],
      subject: 'New fostering application',
      template_name: 'application'
    )
  end
  
  def template_name
    @application.eligible ? 'eligible' : 'ineligible'
  end
end
