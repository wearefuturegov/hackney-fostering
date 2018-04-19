module UserLoginSteps
  
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
