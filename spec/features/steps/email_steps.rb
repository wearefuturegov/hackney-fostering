module EmailSteps
  
  def should_receive_email(address)
    expect(mailbox_for(address).count).to eq(1)
    open_email(address)
  end
  
  step 'the fostering team should recieve an eligible email' do
    should_receive_email('fostering@hackney.gov.uk')
    @application.reload
            
    expect(current_email.body.raw_source).to match(@application.applicant.first_name)
    expect(current_email.body.raw_source).to match(@application.applicant.last_name)
    expect(current_email.body.raw_source).to match(@application.phone_number)
    expect(current_email.body.raw_source).to match(@application.email)
    expect(current_email.body.raw_source).to match(@application.best_way_to_contact)
    expect(current_email.body.raw_source).to match(@application.contact_phone_time)
    expect(current_email.body.raw_source).to match(@application.type_of_fostering)
    expect(current_email.body.raw_source).to match(@application.spare_room)
    expect(current_email.body.raw_source).to match('Yes')
    expect(current_email.body.raw_source).to match(@application.experience)
    expect(current_email.body.raw_source).to match(@application.code)
  end
  
  step 'the fostering team should recieve an ineligible email' do
    should_receive_email('fostering@hackney.gov.uk')
    @application.reload
            
    expect(current_email.body.raw_source).to match(@application.applicant.first_name)
    expect(current_email.body.raw_source).to match(@application.applicant.last_name)
    expect(current_email.body.raw_source).to match(@application.phone_number)
    expect(current_email.body.raw_source).to match(@application.email)
    expect(current_email.body.raw_source).to match(@application.best_way_to_contact)
    expect(current_email.body.raw_source).to match(@application.contact_phone_time)
    expect(current_email.body.raw_source).to match(@application.other_ways)
  end
  
end

RSpec.configure do |config|
  config.include EmailSteps, type: :feature
end
