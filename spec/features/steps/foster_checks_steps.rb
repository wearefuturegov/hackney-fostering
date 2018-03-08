placeholder :step do
  match(/(.*)/) do |step|
    step.split(' ').join('_')
  end
end

step 'I have started a form' do
  @form = Fabricate(:foster_check)
  visit foster_check_form_index_path(@form)
end

step 'I answer the first question' do
  @first_name = 'foo'
  @last_name = 'bar'
  fill_in 'foster_check_name', with: @first_name
  fill_in 'foster_check_last_name', with: @last_name
  click_on 'Continue'
end

step 'my response should be stored' do
  @form.reload
  expect(@form.name).to eq(@first_name)
  expect(@form.last_name).to eq(@last_name)
end

step 'I am answering the :step step' do |step|
  visit foster_check_form_path(@form, step)
end

step 'I should be on the :text step' do |step|
  expect(current_path).to eq foster_check_form_path(@form, step)
end

step 'I check the :answer option' do |answer|
  choose answer.split(' ').join('_')
  click_on 'Continue'
end

step 'I answer :text to the :text question' do |answer, question|
  fill_in question, with: answer
  click_on 'Continue'
end
