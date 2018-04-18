module ConsentSteps
  
  step 'I consent and sign the form' do
    first('label', text: I18n.t('confirm.agree_to_checks')).click
    first('label', text: I18n.t('confirm.agree_to_la_contact')).click
    click_on I18n.t('continue')
  end
  
  step 'I consent without checking the boxes' do
    click_on I18n.t('continue')
  end
  
  step 'I should see the correct error messages' do
    expect(page.body).to match(I18n.t('activerecord.errors.models.application.attributes.agree_to_checks.blank'))
    expect(page.body).to match(I18n.t('activerecord.errors.models.application.attributes.agree_to_la_contact.blank'))
  end
  
end

RSpec.configure do |config|
  config.include ConsentSteps, type: :feature
end
