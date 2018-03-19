module ApplicationSteps
  step :fill_in_radio_button, 'I check the :answer option'
  step :answer_question, 'I answer :text to the :text question'
  step :complete_form, 'I complete the form'
  
  def fill_in_radio_button(answer)
    first('label', text: answer).click
    click_on I18n.t('continue')
  end
  
  def answer_question(answer, question)
    fill_in question, with: answer
  end
  
  def check_boxes(answers)
    answers.each do |a|
      first("input[value='#{a}']", visible: false).click
    end
    click_on I18n.t('continue')
  end
  
  def complete_form # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    visit application_eligibility_index_path(@application)
    @form = Fabricate.build(:application)
    fill_in_radio_button(@form.type_of_fostering)
    fill_in_radio_button(@form.spare_room)
    fill_in_radio_button(@form.over_21 ? 'Yes' : 'No')
    fill_in_radio_button(@form.experience)
    check_boxes(@form.age_experience)
    fill_in_radio_button(@form.housing_type)
    fill_in_radio_button(@form.be_in_touch)
    answer_question(@form.applicant.first_name, 'application_applicant_attributes_first_name')
    answer_question(@form.applicant.last_name, 'application_applicant_attributes_last_name')
    click_on I18n.t('continue')
    answer_question(@form.address.postcode, 'application_address_attributes_postcode')
    click_on I18n.t('continue')
    fill_in_radio_button(@form.contacting_you)
    answer_question(@form.email, 'application_email')
    click_on I18n.t('continue')
  end
  
  step 'my application should be stored' do
    application = Application.first
    expect(application.type_of_fostering).to eq(@form.type_of_fostering)
    expect(application.spare_room).to eq(@form.spare_room)
    expect(application.over_21).to eq(@form.over_21)
    expect(application.experience).to eq(@form.experience)
    expect(application.age_experience).to eq(@form.age_experience)
    expect(application.housing_type).to eq(@form.housing_type)
    expect(application.be_in_touch).to eq(@form.be_in_touch)
    expect(application.applicant.first_name).to eq(@form.applicant.first_name)
    expect(application.applicant.last_name).to eq(@form.applicant.last_name)
    expect(application.address.postcode).to eq(@form.address.postcode)
    expect(application.contacting_you).to eq(@form.contacting_you)
    expect(application.email).to eq(@form.email)
  end
  
  step 'I have started an application' do
    @application = Fabricate(:blank_application)
  end

  step 'my response should be stored' do
    @application.reload
    expect(@application.type_of_fostering).to eq('emergency_fostering')
  end
end

RSpec.configure do |config|
  config.include ApplicationSteps, type: :feature
end
