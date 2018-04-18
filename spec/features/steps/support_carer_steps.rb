module SupportCarerSteps
  
  step 'I add a support carer' do
    @carer = Fabricate(:support_carer)
    click_on I18n.t('continue')
    fill_in 'First name', with: @carer.first_name
    fill_in 'Last name', with: @carer.last_name
    click_on I18n.t('continue')
    fill_in 'Your support carer\'s email address', with: @carer.email
    click_on I18n.t('continue')
  end
  
  step 'my support carer should be saved' do
    @application.reload
    support_carer = @application.support_carer
    expect(support_carer).to_not be_nil
    expect(support_carer.first_name).to eq(@carer.first_name)
    expect(support_carer.last_name).to eq(@carer.last_name)
    expect(support_carer.email).to eq(@carer.email)
  end
  
end

RSpec.configure do |config|
  config.include SupportCarerSteps, type: :feature
end
