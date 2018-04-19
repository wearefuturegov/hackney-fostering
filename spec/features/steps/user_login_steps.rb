module UserLoginSteps
  
  step 'there is a user who wants to apply' do
    @applicant = Fabricate.create(:applicant_with_login)
  end
  
  step 'I go to the send instructions link' do
    visit send_instructions_path(token: @applicant.login.confirmation_token)
  end
  
  step 'a user should be generated' do
    expect(@application.applicant.login).to_not be_nil
  end
  
  step 'a user should not be generated' do
    expect(@application.applicant.login).to be_nil
  end
  
end

RSpec.configure do |config|
  config.include UserLoginSteps, type: :feature
end
