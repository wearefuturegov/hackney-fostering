module UserLoginSteps
  
  step 'there is a user who wants to apply' do
    @applicant = Fabricate.create(:applicant_with_login, application: Fabricate.create(:application))
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
  
  step 'I go to the confirmation link' do
    visit user_login_confirmation_path(confirmation_token: @applicant.login.confirmation_token)
  end
  
  step 'I set a valid password' do
    fill_in 'user_login_password', with: 'validpassword'
    fill_in 'user_login_password_confirmation', with: 'validpassword'
    click_on I18n.t('set_password_continue')
  end
  
  step 'I don\'t set a password' do
    click_on I18n.t('set_password_continue')
  end
  
  step 'I should see an error telling me to provide a password' do
    expect(page.body).to match(I18n.t('activerecord.errors.models.user_login.attributes.password.blank'))
  end
  
  step 'I set non-matching passwords' do
    fill_in 'user_login_password', with: 'idontmatch'
    fill_in 'user_login_password_confirmation', with: 'nope'
    click_on I18n.t('set_password_continue')
  end
  
  step 'I should see an error telling me the passwords don\'t match' do
    expect(page.body).to match(I18n.t('activerecord.errors.models.user_login.attributes.password_confirmation.confirmation'))
  end
  
end

RSpec.configure do |config|
  config.include UserLoginSteps, type: :feature
end
