step 'I click Continue' do
  click_on 'Continue'
end

step 'I :whether_to see :text' do |positive, text|
  expectation = positive ? :to : :not_to
  expect(page).send expectation, have_content(text)
end

placeholder :whether_to do
  match(/should not/) do
    false
  end

  match(/should/) do
    true
  end
end
