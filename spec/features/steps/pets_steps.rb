module PetsSteps
  
  step 'I choose :integer pets' do |num|
    choose_select('number_of_pets', num)
  end
  
  step 'I fill in the details for :integer pet(s)' do |num|
    first('label', text: 'Yes').click
    choose_select('number_of_pets', num)
    click_on I18n.t('continue')
    @pets = []
    num.to_i.times { fill_in_pet_details }
  end
  
  step 'I should have :integer pet(s) recorded' do |num|
    expect(@application.pets.count).to eq(num.to_i)
  end
  
  def fill_in_pet_details # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @pet = Fabricate(:pet)
    @pets << @pet
    fill_in 'pet_pet_type', with: @pet.pet_type
    click_on I18n.t('continue')
    fill_in_radio_button(I18n.t("activerecord.attributes.pet.sizes.#{@pet.size}"))
    first('label', text: (@pet.neutered? ? 'Yes' : 'No')).click
    click_on I18n.t('continue')
    fill_in 'pet_age', with: @pet.age
    click_on I18n.t('continue')
    fill_in 'pet_where_allowed', with: @pet.where_allowed
    click_on I18n.t('continue')
    fill_in 'pet_areas', with: @pet.areas
    click_on I18n.t('continue')
    fill_in 'pet_sleeping_area', with: @pet.sleeping_area
    click_on I18n.t('continue')
    fill_in 'pet_feeding_area', with: @pet.feeding_area
    click_on I18n.t('continue')
    first('label', text: (@pet.safe_around_food? ? 'Yes' : 'No')).click
    click_on I18n.t('continue')
    fill_in 'pet_temperament', with: @pet.temperament
    click_on I18n.t('continue')
    fill_in 'pet_toilet', with: @pet.toilet
    click_on I18n.t('continue')
    first('label', text: (@pet.bitten_or_hurt? ? 'Yes' : 'No')).click
    fill_in 'pet_bitten_or_hurt_detail', with: @pet.temperament
    click_on I18n.t('continue')
    first('label[for*="pet_vet"]', text: (@pet.vet? ? 'Yes' : 'No')).click
    first('label[for*="pet_vaccinations"]', text: (@pet.vaccinations? ? 'Yes' : 'No')).click
    click_on I18n.t('continue')
    fill_in 'pet_children_experience', with: @pet.children_experience
    click_on I18n.t('continue')
    fill_in 'pet_conflict', with: @pet.conflict
    fill_in 'pet_conflict_resolution', with: @pet.conflict_resolution
    click_on I18n.t('continue')
  end
  
end

RSpec.configure do |config|
  config.include PetsSteps, type: :feature
end
