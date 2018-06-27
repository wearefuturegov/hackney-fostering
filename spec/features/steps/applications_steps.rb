module ApplicationSteps
  step :fill_in_radio_button, 'I check the :answer option'
  step :fill_in_radio_button_no_submit, 'I check the :answer option without submitting'
  step :answer_question, 'I answer :text to the :text question'
  step :complete_form, 'I complete the form'
  step :complete_form_ineligible, 'I complete the form and am ineligible'

  def fill_in_radio_button_no_submit(answer)
    fill_in_radio_button(answer, false)
  end

  def fill_in_radio_button(answer, submit = true)
    first('label', text: answer).click
    click_on I18n.t('continue') if submit
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
    visit page_path(id: :eligibility)
    click_on I18n.t('start')
    @application = Application.last
    @applicant ||= Fabricate.build(:applicant_with_email)
    @form ||= Fabricate.build(:application, applicant: @applicant)
    fill_in_radio_button(@form.over_21 ? 'Yes' : 'No')
    fill_in_radio_button(I18n.t("activerecord.attributes.application.spare_rooms.#{@form.spare_room}"))
    fill_in_radio_button(I18n.t("activerecord.attributes.application.housing_types.#{@form.housing_type}"))
    fill_in_radio_button(I18n.t("activerecord.attributes.application.experiences.#{@form.experience}"))
    check_boxes(@form.age_experience)
    click_on I18n.t('continue_ineligible')
    answer_question(@form.applicant.first_name, 'application_applicant_attributes_first_name')
    answer_question(@form.applicant.last_name, 'application_applicant_attributes_last_name')
    fill_in_radio_button(@form.live_in_hackney ? 'Yes' : 'No')
    answer_question(@form.applicant.email, 'application_applicant_attributes_email')
    click_on I18n.t('continue')
    return unless page.has_css?('#application_phone_number')
    answer_question(@form.phone_number, 'application_phone_number')
    click_on I18n.t('continue')
    check_boxes(@form.contact_phone_time)
  end

  def complete_form_ineligible # rubocop:disable Metrics/AbcSize
    visit page_path(id: :eligibility)
    click_on I18n.t('start')
    @applicant = Fabricate.build(:applicant_with_email)
    @form = Fabricate.build(:application, spare_room: 1, applicant: @applicant)
    fill_in_radio_button(@form.over_21 ? 'Yes' : 'No')
    fill_in_radio_button(I18n.t("activerecord.attributes.application.spare_rooms.#{@form.spare_room}"))
    click_on I18n.t('continue_ineligible')
    answer_question(@form.applicant.first_name, 'application_applicant_attributes_first_name')
    answer_question(@form.applicant.last_name, 'application_applicant_attributes_last_name')
    fill_in_radio_button(@form.live_in_hackney ? 'Yes' : 'No')
    answer_question(@form.applicant.email, 'application_applicant_attributes_email')
    click_on I18n.t('continue')
    answer_question(@form.phone_number, 'application_phone_number')
    click_on I18n.t('continue')
    check_boxes(@form.contact_phone_time)
  end
  
  step 'I complete the form with a phone number' do
    @applicant ||= Fabricate.build(:applicant_with_email)
    @form = Fabricate.build(:application, applicant: @applicant)
    complete_form
  end

  step 'my application should be stored' do
    application = Application.first
    expect(application.spare_room).to eq(@form.spare_room)
    expect(application.over_21).to eq(@form.over_21)
    expect(application.experience).to eq(@form.experience)
    expect(application.age_experience.reject(&:blank?)).to eq(@form.age_experience)
    expect(application.housing_type).to eq(@form.housing_type)
    expect(application.applicant.first_name).to eq(@form.applicant.first_name)
    expect(application.applicant.last_name).to eq(@form.applicant.last_name)
    expect(application.live_in_hackney).to eq(@form.live_in_hackney)
    expect(application.applicant.email).to eq(@form.applicant.email)
  end

  step 'I have started an application' do
    visit page_path(id: :eligibility)
    click_on I18n.t('start')
    @application = Application.last
    @applicant = Fabricate.build(:applicant_with_email)
  end
  
  step 'there is an applicant with my email' do
    other_applicant = Fabricate.create(:applicant_with_email)
    @applicant = Fabricate.build(:applicant_with_email, email: other_applicant.email)
  end

  step 'I have completed an application' do
    @application = Fabricate(:complete_application)
  end

  step 'my response should be stored' do
    @application.reload
    expect(@application.type_of_fostering).to eq('emergency_fostering')
  end
  
  step 'I should see an invalid code error' do
    expect(page.body).to match(I18n.t('application.invalid_code'))
  end

  step 'I fill in the :text field' do |field|
    fill_in field, with: 'Some Text'
    click_on I18n.t('continue')
  end

  step 'my application should be marked as eligible' do
    @application.reload
    expect(@application.eligible).to eq(true)
  end

  step 'my application should be marked as ineligible' do
    @application.reload
    expect(@application.eligible).to eq(false)
  end

  step 'I should be on the confirmation page' do
    expect(current_path).to eq(new_applications_confirmation_path)
  end
  
  step 'I should see an error telling me the email is already used' do
    expect(page.body).to match(I18n.t('activerecord.errors.models.applicant.attributes.email.taken'))
  end
  
  step 'there is an eligibility request' do
    @application = Fabricate(:eligibility_application)
  end
  
  step 'I enter my national insurance number' do
    fill_in 'application_ni_number', with: 'AB12345'
    click_on I18n.t('continue')
  end
end

RSpec.configure do |config|
  config.include ApplicationSteps, type: :feature
end
