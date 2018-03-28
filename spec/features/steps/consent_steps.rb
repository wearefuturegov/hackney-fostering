module ConsentSteps
  
  step 'I consent and sign the form' do
    find(:css, '#application_agree_to_checks').set(true)
    find(:css, '#application_agree_to_la_contact').set(true)
    fill_in 'application_signature', with: 'My Name'
    click_on 'Consent and Submit'
  end
  
end

RSpec.configure do |config|
  config.include ConsentSteps, type: :feature
end
