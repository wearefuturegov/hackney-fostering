class CustomDeviseMailer < Devise::Mailer
  layout 'mailer'
  
  def confirmation_instructions(record, token, opts = {})
    opts[:from] = ENV['FOSTERING_EMAIL_ADDRESS']
    opts[:subject] = 'Continue your Hackney Fostering application'
    super
  end
  
end
