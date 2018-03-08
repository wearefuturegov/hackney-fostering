placeholder :step do
  match(/(.*)/) do |step|
    step.split(' ').join('_')
  end
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

step 'I check the :answer option' do |answer|
  first('label', text: answer).click
  click_on 'Continue'
end

step 'I answer :text to the :text question' do |answer, question|
  fill_in question, with: answer
  click_on 'Continue'
end
