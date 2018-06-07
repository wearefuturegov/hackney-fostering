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
    expect(find_person_by(referee, :first_name)).to_not be_nil
    expect(find_person_by(referee, :last_name)).to_not be_nil

    address = referee.address
    
    expect(find_address_by(address, :line_1)).to_not be_nil
    expect(find_address_by(address, :line_2)).to_not be_nil
    expect(find_address_by(address, :line_3)).to_not be_nil
    expect(find_address_by(address, :post_town)).to_not be_nil
    expect(find_address_by(address, :postcode)).to_not be_nil

    expect(find_person_by(referee, :email)).to_not be_nil
    expect(find_person_by(referee, :phone_number)).to_not be_nil
    expect(find_person_by(referee, :relationship)).to_not be_nil
    expect(find_person_by(referee, :years_known)).to_not be_nil
  end
  
  def find_person_by(person, attr)
    @people.find { |p| p.send(attr) == person.send(attr) }
  end
  
  def find_address_by(address, attr)
    @addresses.find { |a| a[attr] == address.send(attr) }
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
