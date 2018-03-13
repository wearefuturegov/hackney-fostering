module AddressSteps
  
  step :fill_in_address, 'I fill in my address'
  step :fill_in_address_and_date, 'I fill in my address and a moved in date'
  step :fill_in_date, 'I enter a moved in date of :number year(s) ago'
  step :fill_in_address_and_date_manually, 'I fill in my address and a moved in date manually'
  
  step 'I enter another address with a moved in date of :number year(s) ago' do |years|
    fill_in_address
    fill_in_date(years)
  end
  
  step 'I fill in a postcode that does not exist' do
    enter_postcode('ID1 KFA')
  end
  
  step 'I should have :number previous address' do |number|
    @form.reload
    expect(@form.addresses.count).to eq(number.to_i)
    @postcodes.each do |p|
      expect(@form.addresses.find_by(postcode: p)).to_not be_nil
    end
  end
  
  step 'my address should be saved in the database' do
    @application.reload
    expect(@application.address.line_1).to eq(@line1)
    expect(@application.address.line_2).to eq(@line2)
    expect(@application.address.line_3).to eq(@line3)
    expect(@application.address.post_town).to eq(@post_town)
    expect(@application.address.postcode).to eq(@postcode)
    expect(@application.address.date_from).to eq(@date)
  end
  
  def fill_in_address_and_date_manually
    find('#manual_entry').click
    @line1 = 'Flat 1'
    @line2 = '123 Test Street'
    @line3 = 'Testington'
    @post_town = 'Test Town'
    @postcode = 'TEST 123'
    fill_in 'Address Line 1', with: @line1
    fill_in 'Address Line 2', with: @line2
    fill_in 'Address Line 3', with: @line3
    fill_in 'Address Town', with: @post_town
    fill_in 'Postcode', with: @postcode
    fill_in_date(6)
    click_on 'Continue'
  end
  
  def fill_in_address_and_date
    fill_in_address(false)
    fill_in_date(6)
    click_on 'Continue'
  end
  
  def enter_postcode(postcode)
    fill_in 'What is your postcode?', with: postcode
    first('#find_address').click
    wait_for_ajax
  end
  
  def fill_in_address(click_continue = true)
    @postcode = 'ID1 1QD'
    enter_postcode(@postcode)
    find('#addresses > option:nth-child(2)').click
    @line1 = find_field('Address Line 1').value
    @line2 = find_field('Address Line 2').value
    @line3 = find_field('Address Line 3').value
    @post_town = find_field('Address Town').value
    page.execute_script '$(".confirm")[0].scrollIntoView(true)'
    click_on('Continue') if click_continue
  end
  
  def fill_in_date(years) # rubocop:disable Metrics/AbcSize
    @date = Date.today - years.to_i.years
    first("select[name*='date_from(1i)']").find(:option, @date.year).click
    first("select[name*='date_from(2i)']").find(:option, @date.strftime('%B')).click
    first("select[name*='date_from(3i)']").find(:option, @date.day).click
  end
  
end

RSpec.configure do |config|
  config.include AddressSteps, type: :feature
end
