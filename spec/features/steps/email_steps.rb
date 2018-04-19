module EmailSteps
  
  def should_receive_email(address)
    expect(mailbox_for(address).count).to eq(1)
    open_email(address)
  end
  
  step 'the fostering team should recieve an eligible email' do
    should_receive_email(ENV['FOSTERING_EMAIL_ADDRESS'])
    expect(current_email.subject).to eq('New eligibility enquiry')
    expect(current_email.body.raw_source).to match(
      'Someone has filled in an eligibility checker on the Hackney Fostering website'
    )
  end
  
  step 'the fostering team should recieve an ineligible email' do
    should_receive_email(ENV['FOSTERING_EMAIL_ADDRESS'])
    expect(current_email.subject).to eq('New eligibility enquiry')
    expect(current_email.body.raw_source).to match('They were not eligible to foster')
  end
  
  step 'the fostering team should recieve an application email' do
    should_receive_email(ENV['FOSTERING_EMAIL_ADDRESS'])
    expect(current_email.subject).to eq('New fostering application')
  end
  
  step 'the user should recieve an email with instructions on how to access their application' do
    should_receive_email(@applicant.email)
  end
  
end

RSpec.configure do |config|
  config.include EmailSteps, type: :feature
end
