module ConsentSteps
  
  step 'I consent and sign the form' do
    click_on I18n.t('continue')
  end
  
end

RSpec.configure do |config|
  config.include ConsentSteps, type: :feature
end
