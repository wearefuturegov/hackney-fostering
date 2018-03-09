placeholder :step do
  match(/(.*)/) do |step|
    step.split(' ').join('_')
  end
end

module ApplicationSteps
  step :fill_in_radio_button, 'I check the :answer option'
  step :answer_question, 'I answer :text to the :text question'
  step :complete_form, 'I complete the form'
  
  def fill_in_radio_button(answer)
    first('label', text: answer).click
    click_on 'Continue'
  end
  
  def answer_question(answer, question)
    fill_in question, with: answer
  end
  
  def check_boxes(answers)
    answers.each do |a|
      first("input[value='#{a}']", visible: false).click
    end
    click_on 'Continue'
  end
  
  def complete_form # rubocop:disable Metrics/AbcSize
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
    click_on 'Continue'
    answer_question(@form.address.postcode, 'application_address_attributes_postcode')
    click_on 'Continue'
    fill_in_radio_button(@form.contacting_you)
    answer_question(@form.email, 'application_email')
    click_on 'Continue'
  end
  
  step 'my application should be stored' do
    expect(Application.count).to eq(1)
  end
  
  step 'I have started a form' do
    @form = Fabricate(:application)
    visit application_form_index_path(@form)
  end

  step 'my response should be stored' do
    @form.reload
    expect(@form.type_of_fostering).to eq('emergency_fostering')
  end

  step 'I am answering the :step step' do |step|
    visit application_form_path(@form, step)
  end

  step 'I should be on the :text step' do |step|
    expect(current_path).to eq application_form_path(@form, step)
  end
end

RSpec.configure do |config|
  config.include ApplicationSteps, type: :feature
end
