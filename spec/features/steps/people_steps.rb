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
  
  def fill_in_people(count, type)
    first('label', text: 'Yes').click
    click_on I18n.t('continue')
    @people = []
    if type.match?(/child/)
      count.to_i.times { fill_in_child_details }
    else
      count.to_i.times { fill_in_adult_details }
    end
    click_on I18n.t('continue')
  end
  
  def should_have_people(count, type)
    people = @application.send(type.to_sym)
    expect(people.count).to eq(count.to_i)
    people.each do |person|
      person_should_be_saved person
    end
  end
  
  def choose_select(field, option)
    find("#application_#{field} > option[value='#{option}']").click
  end
  
  def person_should_be_saved(person) # rubocop:disable Metrics/AbcSize
    expect(find_person_by(person, :first_name)).to_not be_nil
    expect(find_person_by(person, :last_name)).to_not be_nil
    expect(find_person_by(person, :gender)).to_not be_nil
    expect(find_person_by(person, :date_of_birth)).to_not be_nil
    expect(find_person_by(person, :relationship)).to_not be_nil
    expect(find_person_by(person, :school)).to_not be_nil if person.school
    expect(find_person_by(person, :school_contact)).to_not be_nil if person.school
  end
  
  def find_person_by(person, attr)
    @people.find { |p| p.send(attr) == person.send(attr) }
  end
  
  def fill_in_person
    @people << @person
    fill_in 'First name', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    first('label', text: I18n.t("activerecord.attributes.person.genders.#{@person.gender}")).click
    fill_in_date('date_of_birth', @person.date_of_birth)
    find("select > option[value=#{@person.relationship}]").click
  end
  
  def fill_in_adult_details
    @person = Fabricate(:adult)
    fill_in_person
    click_on I18n.t('person.add')
  end
  
  def fill_in_child_details
    @person = Fabricate(:child)
    fill_in_person
    fill_in 'Child\'s School', with: @person.school
    fill_in 'School phone number', with: @person.school_contact
    click_on I18n.t('person.add')
  end
  
end

RSpec.configure do |config|
  config.include PeopleSteps, type: :feature
end
