module RefereeSteps
  
  step :add_a_referee, 'I add a referee'

  step 'I am adding a referee' do
    visit applications_referees_path
  end
  
  step 'I add :integer referees' do |num|
    num.to_i.times do
      add_a_referee
    end
    click_on I18n.t('continue')
  end
  
  step 'my referees should be saved' do
    expect(@people.count).to eq(@application.referees.count)
    @people.reverse!
    @application.referees.each_with_index do |person, i|
      referee_should_be_saved(person, i)
    end
  end
  
  step 'my referee should be saved' do
    referee = @application.referees.first
    referee_should_be_saved(referee, 0)
  end
  
  def referee_should_be_saved(referee, index) # rubocop:disable Metrics/AbcSize
    expect(referee.first_name).to eq(@people[index].first_name)
    expect(referee.last_name).to eq(@people[index].last_name)
    address = referee.address
    expect(address.line_1).to eq(@addresses[index][:line1])
    expect(address.line_2).to eq(@addresses[index][:line2])
    expect(address.line_3).to eq(@addresses[index][:line3])
    expect(address.post_town).to eq(@addresses[index][:post_town])
    expect(address.postcode).to eq(@addresses[index][:postcode])
    expect(referee.email).to eq(@people[index].email)
    expect(referee.phone_number).to eq(@people[index].phone_number)
    expect(referee.relationship).to eq(@people[index].relationship)
    expect(referee.years_known).to eq(@people[index].years_known)
  end
  
  def add_a_referee # rubocop:disable Metrics/AbcSize
    @people ||= []
    @person = Fabricate(:referee)
    fill_in 'First name', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    fill_in_address(false)
    fill_in 'Email', with: @person.email
    fill_in 'Phone Number', with: @person.phone_number
    select I18n.t("activerecord.attributes.person.relationships.#{@person.relationship}"), from: 'Relationship'
    fill_in 'How many years have you known each other?', with: @person.years_known
    click_on I18n.t('referee.add')
    @people << @person
  end
  
end

RSpec.configure do |config|
  config.include RefereeSteps, type: :feature
end
