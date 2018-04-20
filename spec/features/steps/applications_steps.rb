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

  def complete_form # rubocop:disable Metrics/AbcSize
    visit application_eligibility_index_path(@application)
    @form = Fabricate.build(:application, applicant: @applicant)
    # check_boxes(@form.type_of_fostering)
    fill_in_radio_button(@form.over_21 ? 'Yes' : 'No')
    fill_in_radio_button(I18n.t("activerecord.attributes.application.spare_rooms.#{@form.spare_room}"))
    fill_in_radio_button(I18n.t("activerecord.attributes.application.housing_types.#{@form.housing_type}"))
    fill_in_radio_button(I18n.t("activerecord.attributes.application.experiences.#{@form.experience}"))
    check_boxes(@form.age_experience)
    fill_in_radio_button(I18n.t("activerecord.attributes.application.be_in_touches.#{@form.be_in_touch}"))
    answer_question(@form.applicant.first_name, 'application_applicant_attributes_first_name')
    answer_question(@form.applicant.last_name, 'application_applicant_attributes_last_name')
    click_on I18n.t('continue')
    answer_question(@form.address.postcode, 'application_address_attributes_postcode')
    click_on I18n.t('continue')
    fill_in_radio_button(I18n.t("activerecord.attributes.application.contacting_yous.#{@form.contacting_you}"))
    answer_question(@form.applicant.email, 'application_applicant_attributes_email')
    click_on I18n.t('continue')
  end

  def complete_form_ineligible # rubocop:disable Metrics/AbcSize
    visit application_eligibility_index_path(@application)
    @form = Fabricate.build(:application, spare_room: 1, applicant: @applicant)
    # check_boxes(@form.type_of_fostering)
    fill_in_radio_button(@form.over_21 ? 'Yes' : 'No')
    fill_in_radio_button(I18n.t("activerecord.attributes.application.spare_rooms.#{@form.spare_room}"))
    click_on I18n.t('continue_ineligible')
    answer_question(@form.applicant.first_name, 'application_applicant_attributes_first_name')
    answer_question(@form.applicant.last_name, 'application_applicant_attributes_last_name')
    click_on I18n.t('continue')
    answer_question(@form.address.postcode, 'application_address_attributes_postcode')
    click_on I18n.t('continue')
    fill_in_radio_button(I18n.t("activerecord.attributes.application.contacting_yous.#{@form.contacting_you}"))
    answer_question(@form.applicant.email, 'application_applicant_attributes_email')
    click_on I18n.t('continue')
  end

  step 'my application should be stored' do
    application = Application.first
    expect(application.type_of_fostering.reject(&:blank?)).to eq(@form.type_of_fostering)
    expect(application.spare_room).to eq(@form.spare_room)
    expect(application.over_21).to eq(@form.over_21)
    expect(application.experience).to eq(@form.experience)
    expect(application.age_experience.reject(&:blank?)).to eq(@form.age_experience)
    expect(application.housing_type).to eq(@form.housing_type)
    expect(application.be_in_touch).to eq(@form.be_in_touch)
    expect(application.applicant.first_name).to eq(@form.applicant.first_name)
    expect(application.applicant.last_name).to eq(@form.applicant.last_name)
    expect(application.address.postcode).to eq(@form.address.postcode)
    expect(application.contacting_you).to eq(@form.contacting_you)
    expect(application.applicant.email).to eq(@form.applicant.email)
  end

  step 'I have started an application' do
    @application = Fabricate(:blank_application)
    @applicant = Fabricate.build(:applicant_with_email)
  end
  
  step 'there is an applicant with my email' do
    Fabricate.create(:applicant_with_email, email: @applicant.email)
  end

  step 'I have completed an application' do
    @application = Fabricate(:complete_application)
  end

  step 'my response should be stored' do
    @application.reload
    expect(@application.type_of_fostering).to eq('emergency_fostering')
  end

  step 'I enter the correct code' do
    fill_in 'application_application_id', with: @application.code
    click_on I18n.t('continue_b')
  end

  step 'I enter an incorrect code' do
    fill_in 'application_application_id', with: 'sdsdfdfsdf'
    click_on I18n.t('continue_b')
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
    expect(current_path).to eq(new_application_confirmation_path(application_id: @application.code))
  end
  
  step 'I should see an error telling me the email is already used' do
    expect(page.body).to match(I18n.t('activerecord.errors.models.applicant.attributes.email.taken'))
  end
  
  step 'there is an eligibility request' do
    @application = Fabricate(:eligibility_application)
  end
end

RSpec.configure do |config|
  config.include ApplicationSteps, type: :feature
end
