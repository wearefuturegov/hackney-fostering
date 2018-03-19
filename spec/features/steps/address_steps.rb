module AddressSteps
  
  step :fill_in_address, 'I fill in my address'
  step :fill_in_address_and_date, 'I fill in my address and a moved in date'
  step :fill_in_address_and_date, 'I fill in my address and a moved in date of :number year(s) ago'
  step :fill_in_date, 'I enter a moved in date of :number year(s) ago'
  step :fill_in_address_and_date_manually, 'I fill in my address and a moved in date manually'
  
  step 'I enter another address with a moved in date of :number year(s) ago' do |years|
    fill_in_address
    fill_in_date_from(years)
  end
  
  step 'I fill in a postcode that does not exist' do
    enter_postcode('ID1 KFA')
  end
  
  step 'I should have :number previous address(es)' do |number|
    @application.reload
    expect(@application.addresses.count).to eq(number.to_i)
    @application.addresses.each_with_index do |address, i|
      address_should_be_saved address, i
    end
  end
  
  step 'my address should be saved in the database' do
    @application.reload
    address_should_be_saved @application.address, 0
  end
  
  def address_should_be_saved(address, index) # rubocop:disable Metrics/AbcSize
    expect(address.line_1).to eq(@addresses[index][:line1])
    expect(address.line_2).to eq(@addresses[index][:line2])
    expect(address.line_3).to eq(@addresses[index][:line3])
    expect(address.post_town).to eq(@addresses[index][:post_town])
    expect(address.postcode).to eq(@addresses[index][:postcode])
    expect(address.date_from).to eq(@addresses[index][:date])
  end
  
  def fill_in_address_and_date_manually # rubocop:disable Metrics/AbcSize
    find('#manual_entry').click
    address = {}
    address[:line1] = 'Flat 1'
    address[:line2] = '123 Test Street'
    address[:line3] = 'Testington'
    address[:post_town] = 'Test Town'
    address[:postcode] = 'TEST 123'
    fill_in 'Line 1', with: address[:line1]
    fill_in 'Line 2', with: address[:line2]
    fill_in 'Line 3', with: address[:line3]
    fill_in 'Town', with: address[:post_town]
    fill_in 'Postcode', with: address[:postcode]
    @addresses ||= []
    @addresses << address
    fill_in_date_from(6)
    first('.add-address').click
  end
  
  def fill_in_address_and_date(years = 6)
    fill_in_address(false)
    fill_in_date_from(years)
    first('.add-address').click
  end
  
  def enter_postcode(postcode)
    fill_in 'What is your postcode?', with: postcode
    first('#find_address').click
    wait_for_ajax
  end
  
  def fill_in_address(click_continue = true) # rubocop:disable Metrics/AbcSize
    postcode = 'ID1 1QD'
    enter_postcode(postcode)
    find('#addresses > option:nth-child(2)').click
    address = {}
    address[:line1] = find_field('Line 1').value
    address[:line2] = find_field('Line 2').value
    address[:line3] = find_field('Line 3').value
    address[:post_town] = find_field('Town').value
    address[:postcode] = postcode
    @addresses ||= []
    @addresses << address
    page.execute_script '$(".confirm")[0].scrollIntoView(true)'
    first('.add-address').click if click_continue
  end
  
  def fill_in_date_from(years)
    field = 'date_from'
    date = Date.today - years.to_i.years
    fill_in_date(field, date)
    @addresses.last[:date] = date
  end
  
  def fill_in_date(field, date)
    first("select[name*='#{field}(1i)']").find(:option, date.year).click
    first("select[name*='#{field}(2i)']").find(:option, date.strftime('%B')).click
    first("select[name*='#{field}(3i)']").find(:option, date.day).click
  end
  
end

RSpec.configure do |config|
  config.include AddressSteps, type: :feature
end
