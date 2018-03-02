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
