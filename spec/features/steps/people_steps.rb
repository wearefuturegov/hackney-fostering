module PeopleSteps
  
  step 'I choose :integer child(ren)' do |num|
    choose_select('number_of_children', num)
  end
  
  step 'I choose :integer child(ren) living elsewhere' do |num|
    choose_select('number_of_children_elsewhere', num)
  end
  
  step 'I choose :integer adult(s)' do |num|
    choose_select('number_of_adults', num)
  end
  
  step 'I fill in the details for :integer child(ren) living elsewhere' do |count|
    first('label', text: 'Yes').click
    choose_select('number_of_children_elsewhere', count.to_i)
    click_on I18n.t('continue')
    @people = []
    count.to_i.times { fill_in_child_details }
  end
  
  step 'I fill in the details for :integer child(ren)' do |count|
    first('label', text: 'Yes').click
    choose_select('number_of_children', count.to_i)
    click_on I18n.t('continue')
    @people = []
    count.to_i.times { fill_in_child_details }
  end
  
  step 'I should have :integer child(ren) recorded' do |count|
    expect(@application.children.count).to eq(count.to_i)
    @application.children.each_with_index do |person, i|
      person_should_be_saved person, i
    end
  end
  
  step 'I should have :integer child(ren) living elsewhere recorded' do |count|
    expect(@application.children_elsewhere.count).to eq(count.to_i)
    @application.children_elsewhere.each_with_index do |person, i|
      person_should_be_saved person, i
    end
  end
  
  def choose_select(field, option)
    find("#application_#{field} > option[value='#{option}']").click
  end
  
  def person_should_be_saved(person, index) # rubocop:disable Metrics/AbcSize
    expect(person.first_name).to eq(@people[index].first_name)
    expect(person.last_name).to eq(@people[index].last_name)
    expect(person.gender).to eq(@people[index].gender)
    expect(person.date_of_birth).to eq(@people[index].date_of_birth)
    expect(person.relationship).to eq(@people[index].relationship)
    expect(person.school).to eq(@people[index].school)
    expect(person.school_contact).to eq(@people[index].school_contact)
  end
  
  def fill_in_child_details # rubocop:disable Metrics/AbcSize
    @person = Fabricate(:child)
    @people << @person
    fill_in 'First name(s)', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    click_on I18n.t('continue')
    first('label', text: @person.gender).click
    click_on I18n.t('continue')
    fill_in_date('date_of_birth', @person.date_of_birth)
    click_on I18n.t('continue')
    find("#person_relationship > option[value=#{@person.relationship}]").click
    click_on I18n.t('continue')
    fill_in 'person_school', with: @person.school
    fill_in 'person_school_contact', with: @person.school_contact
    click_on I18n.t('continue')
  end
  
end

RSpec.configure do |config|
  config.include PeopleSteps, type: :feature
end
