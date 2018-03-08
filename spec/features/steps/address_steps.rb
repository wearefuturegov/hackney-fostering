module AddressSteps
  
  step :fill_in_address, 'I fill in my address'
  step :fill_in_date, 'I enter a moved in date of :number year(s) ago'
  
  step 'I enter another address with a moved in date of :number year(s) ago' do |years|
    fill_in_address
    fill_in_date(years)
  end
  
  step 'I should have :number previous address' do |number|
    @form.reload
    expect(@form.addresses.count).to eq(number.to_i)
    @postcodes.each do |p|
      expect(@form.addresses.find_by(postcode: p)).to_not be_nil
    end
  end
  
  def fill_in_address
    @postcodes ||= []
    @postcodes << FFaker::AddressUK.postcode
    fill_in 'Find your address', with: @postcodes.last
  end
  
  def fill_in_date(years) # rubocop:disable Metrics/AbcSize
    date = Date.today - years.to_i.years
    first("select[name*='date_from(1i)']").find(:option, date.year).click
    first("select[name*='date_from(2i)']").find(:option, date.strftime('%B')).click
    first("select[name*='date_from(3i)']").find(:option, date.day).click
    click_on 'Continue'
  end
  
end

RSpec.configure do |config|
  config.include AddressSteps, type: :feature
end
