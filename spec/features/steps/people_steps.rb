placeholder :person_type do
  match(/child(ren)? living elsewhere/) do
    'children_elsewhere'
  end
  match(/child(ren)?/) do
    'children'
  end
  match(/adults? living elsewhere/) do
    'adults_elsewhere'
  end
  match(/adults?/) do
    'adults'
  end
end

module PeopleSteps
  
  step :choose_number_of_people, 'I choose :integer :person_type'
  step :fill_in_people, 'I fill in the details for :integer :person_type'
  step :should_have_people, 'I should have :integer :person_type recorded'

  def choose_number_of_people(num, type)
    choose_select("number_of_#{type}", num)
  end
  
  def fill_in_people(count, type)
    first('label', text: 'Yes').click
    choose_number_of_people(count.to_i, type)
    click_on I18n.t('continue')
    @people = []
    if type.match?(/child/)
      count.to_i.times { fill_in_child_details }
    else
      count.to_i.times { fill_in_adult_details }
    end
  end
  
  def should_have_people(count, type)
    people = @application.send(type.to_sym)
    expect(people.count).to eq(count.to_i)
    @people.reverse!
    people.each_with_index do |person, i|
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
    expect(person.school).to eq(@people[index].school) if @people[index].school
    expect(person.school_contact).to eq(@people[index].school_contact) if @people[index].school
  end
  
  def fill_in_person # rubocop:disable Metrics/AbcSize
    @people << @person
    fill_in 'First name(s)', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    click_on I18n.t('continue')
    first('label', text: I18n.t("activerecord.attributes.person.genders.#{@person.gender}")).click
    click_on I18n.t('continue')
    fill_in_date('date_of_birth', @person.date_of_birth)
    click_on I18n.t('continue')
    find("select > option[value=#{@person.relationship}]").click
    click_on I18n.t('continue')
  end
  
  def fill_in_adult_details
    @person = Fabricate(:person)
    fill_in_person
  end
  
  def fill_in_child_details
    @person = Fabricate(:child)
    fill_in_person
    fill_in 'Name of the school', with: @person.school
    fill_in 'School phone number', with: @person.school_contact
    click_on I18n.t('continue')
  end
  
end

RSpec.configure do |config|
  config.include PeopleSteps, type: :feature
end
