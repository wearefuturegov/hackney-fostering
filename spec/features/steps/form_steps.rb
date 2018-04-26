placeholder :step do
  match(/(.*)/) do |step|
    step.split(' ').join('_')
  end
end

placeholder :form do
  match(/(.*)/) do |form|
    form.split(' ').join('_')
  end
end

step 'I am answering the :step step of the :form form' do |step, form|
  @path = "applications_#{form}_path".to_sym
  visit send(@path, step)
end

step 'I should be on the :text step' do |step|
  expect(current_path).to match(%r{^.+\/#{step}$})
end
